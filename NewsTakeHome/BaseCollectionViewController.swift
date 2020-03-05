//
//  BaseCollectionViewController.swift
//  NewsTakeHome
//
//  Created by Ramon Geronimo on 1/27/20.
//  Copyright © 2020 Ramon Geronimo. All rights reserved.
//

import UIKit

class BaseCollectionViewController: UICollectionViewController {
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        
        if #available(iOS 12.0, *) {
            if traitCollection.userInterfaceStyle == .light {
                //Light mode
                collectionView.backgroundColor = .white
            } else {
                //DARK
                collectionView.backgroundColor = .black
            }
        } else {
            // Fallback on earlier versions
            collectionView.backgroundColor = .white
        }
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()

            if traitCollection.userInterfaceStyle == .light {
             
                appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
                appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]

                UINavigationBar.appearance().tintColor = .black
                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().compactAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
            } else {
              //DARK
                appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
                appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

                UINavigationBar.appearance().tintColor = .white
                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().compactAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
            }
            
        } else {
            UINavigationBar.appearance().tintColor = .white

            UINavigationBar.appearance().isTranslucent = false
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
