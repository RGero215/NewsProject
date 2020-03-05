//
//  NewsStandCell.swift
//  NewsTakeHome
//
//  Created by Ramon Geronimo on 1/27/20.
//  Copyright © 2020 Ramon Geronimo. All rights reserved.
//

import UIKit

class NewsStandCell: UICollectionViewCell {
    
    let newsIcon: UIImageView = {
        let iv = UIImageView()
        iv.widthAnchor.constraint(equalToConstant: 200).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 200).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        return iv
    }()
    
    let newsLabel: UILabel = {
        let label = UILabel()
        label.text = "NewsStand"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let stackview = UIStackView(arrangedSubviews: [newsIcon, newsLabel])
        stackview.spacing = 8
        stackview.axis = .vertical
        stackview.alignment = .center
        stackview.distribution = .fillProportionally
        addSubview(stackview)
        stackview.fillSuperview(padding: .init(top: 8, left: 8, bottom: 8, right: 8))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
