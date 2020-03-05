//
//  Service.swift
//  NewsTakeHome
//
//  Created by Ramon Geronimo on 1/27/20.
//  Copyright © 2020 Ramon Geronimo. All rights reserved.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    
    
    func fetchNews(search: String, completion: @escaping (Articles?, Error?) -> ()) {
        let urlString = "https://newsapi.org/v2/everything?q=\(search)&apiKey=0fc90a0c5e934de58e2aa2759ed703e9"
        
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchTopHeadlines(completion: @escaping (Articles?, Error?) -> ()) {
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=0fc90a0c5e934de58e2aa2759ed703e9"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
                   
           if let err = err {
               completion(nil, err)
               return
           }
           
           do {
               let objects = try JSONDecoder().decode(T.self, from: data!)
               completion(objects, nil)
           } catch {
               completion(nil, error)
               print("Failed to decode: ", error)
           }
           
       }.resume()
    }
}
