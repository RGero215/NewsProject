//
//  NewsStandViewController.swift
//  NewsTakeHome
//
//  Created by Ramon Geronimo on 1/27/20.
//  Copyright © 2020 Ramon Geronimo. All rights reserved.
//

import UIKit

class NewsStandViewController: BaseCollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    var news: [News] = []
    
    fileprivate let cellId = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Newsstand"
       
        collectionView.register(NewsStandCell.self, forCellWithReuseIdentifier: cellId)
        
        setupSearchBar()
        fetchTopHeadlines()
    }
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    fileprivate func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        fetchTopHeadlines()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  16
        let collectionViewSize = collectionView.frame.size.width - padding

        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2 + 100)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredNews.count > 0 ? filteredNews.count : news.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! NewsStandCell
        let news = self.filteredNews.count > 0 ? self.filteredNews[indexPath.row] : self.news[indexPath.row]
        cell.newsLabel.text = news.source.name
        cell.newsIcon.imageFromURL(urlString: news.urlToImage ?? "")
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selecting...")
        let news = self.filteredNews.count > 0 ? self.filteredNews[indexPath.row] : self.news[indexPath.row]
        let category = CategoryViewController()
        category.title = news.source.name
        category.headline = news.title
        category.imageURL = news.urlToImage ?? ""
        category.content = news.content ?? ""
        category.author = news.author ?? ""
        self.navigationController!.pushViewController(category, animated: true)
    }
    
    fileprivate func fetchNews(search: String) {
        Service.shared.fetchNews(search: search) { (news, error) in
            if let error = error {
                print("Failed to fetch news: ", error)
                return
            }
            
            guard let news = news else {return}
            self.news = news.articles
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
    }
    
    fileprivate func fetchTopHeadlines() {
        Service.shared.fetchTopHeadlines { (news, error) in
            if let error = error {
                print("Failed to fetch headlines: ", error)
                return
            }
            
            guard let news = news else {return}
            self.news = news.articles
            print("News: ", self.news)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    var timer: Timer?
    var filteredNews = [News]()
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredNews = news
        print("Article: ", searchText)
        // Delay search throttling the search
        
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            if searchText.isEmpty == false {
                self.filteredNews = self.news.filter({ $0.title.contains(searchText)})
                
                DispatchQueue.main.async {
                    self.fetchNews(search: searchText)
                    self.collectionView.reloadData()
                }
            } else {
                self.filteredNews = self.news
                DispatchQueue.main.async {
                    self.fetchTopHeadlines()
                    self.collectionView.reloadData()
                }
            }
            
        })

    }


}

