//
//  RecentProductsCollectionViewCell.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-19.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit

class RecentProductsCollectionViewCell: UICollectionViewCell {
    
    var recentProduct: FakeRecentProductsModel? {
        didSet {
            productTitleLabel.text = recentProduct?.title
            productImageView.image = recentProduct?.image
        }
    }
    private let productImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.backgroundColor = UIColor.rgb(red: 239, green: 239, blue: 239)
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
        layer.cornerRadius = 5
        layer.masksToBounds = true
        layer.borderWidth = 0.3
        layer.borderColor = UIColor.lightGray.cgColor
        
        addSubview(productImageView)
        let height = self.frame.height * 2 / 3
        productImageView.anchorConstraints(topAnchor: topAnchor, topConstant: 0, leftAnchor: leftAnchor, leftConstant: 0, rightAnchor: rightAnchor, rightConstant: 0, bottomAnchor: nil, bottomConstant: 0, heightConstant: height, widthConstant: 0)
        
        addSubview(productTitleLabel)
        productTitleLabel.anchorConstraints(topAnchor: productImageView.bottomAnchor, topConstant: 4, leftAnchor: productImageView.leftAnchor, leftConstant: 4, rightAnchor: nil, rightConstant: 0, bottomAnchor: nil, bottomConstant: 0, heightConstant: 0, widthConstant: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
