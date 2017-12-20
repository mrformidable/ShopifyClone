//
//  RecentProductsCollectionViewCell.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-19.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit

class RecentProductsCollectionViewCell: UICollectionViewCell {
    
    private let productImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .cyan
        return iv
    }()
    
    private let productTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title Test 1"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private let productSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Recently Edited Products"
        label.font = UIFont.boldSystemFont(ofSize: 14)
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
        let height = self.frame.height * 2 / 3
        productImageView.anchorConstraints(topAnchor: topAnchor, topConstant: 0, leftAnchor: leftAnchor, leftConstant: 0, rightAnchor: rightAnchor, rightConstant: 0, bottomAnchor: nil, bottomConstant: 0, heightConstant: height, widthConstant: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
