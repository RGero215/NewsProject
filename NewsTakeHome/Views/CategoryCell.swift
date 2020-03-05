//
//  CategoryCell.swift
//  NewsTakeHome
//
//  Created by Ramon Geronimo on 1/27/20.
//  Copyright © 2020 Ramon Geronimo. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    let categoryIcon: UIImageView = {
        let iv = UIImageView()
        iv.widthAnchor.constraint(equalToConstant: 120).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 120).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        return iv
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Category"
        label.numberOfLines = 5
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let stackview = UIStackView(arrangedSubviews: [ categoryLabel, categoryIcon])
        stackview.spacing = 8
        stackview.alignment = .center
        stackview.distribution = .fillProportionally
        addSubview(stackview)
        stackview.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
