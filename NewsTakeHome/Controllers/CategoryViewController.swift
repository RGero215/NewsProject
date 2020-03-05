//
//  CategoryViewController.swift
//  NewsTakeHome
//
//  Created by Ramon Geronimo on 1/27/20.
//  Copyright © 2020 Ramon Geronimo. All rights reserved.
//

import UIKit

class CategoryViewController: BaseCollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    fileprivate let cellId = "cell"
    var imageURL = ""
    var headline = ""
    var content = ""
    var author = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Category"
        self.navigationItem.largeTitleDisplayMode = .never
       
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return .init(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        cell.categoryLabel.text = headline
        cell.categoryIcon.imageFromURL(urlString: imageURL)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected")
        let news = NewsViewController()
        news.content = content
        news.name = author
        self.navigationController!.pushViewController(news, animated: true)
    }


}
