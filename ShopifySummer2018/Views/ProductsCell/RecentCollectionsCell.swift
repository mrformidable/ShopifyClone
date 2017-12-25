//
//  RecentCollectionsCell.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-23.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit

class RecentCollectionCell: UICollectionViewCell {
    
    private let productImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .cyan
        return iv
    }()
    
    private let productTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title Test 1"
        label.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.medium)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    private func setupViews() {
        backgroundColor = UIColor.yellow
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        addSubview(productImageView)
        productImageView.anchorConstraints(topAnchor: topAnchor, topConstant: 8, leftAnchor: leftAnchor, leftConstant: 8, rightAnchor: nil, rightConstant: 0, bottomAnchor: nil, bottomConstant: 0, heightConstant: 50, widthConstant: 50)
        //productImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(productTitleLabel)
        productTitleLabel.anchorConstraints(topAnchor: productImageView.bottomAnchor, topConstant: 8, leftAnchor: productImageView.leftAnchor, leftConstant: 0, rightAnchor: nil, rightConstant: 0, bottomAnchor: nil, bottomConstant: 0, heightConstant: 0, widthConstant: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
