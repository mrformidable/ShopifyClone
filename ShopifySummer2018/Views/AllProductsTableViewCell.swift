//
//  AllProductsTableViewCell.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-20.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit


class AllProductsTableViewCell: UITableViewCell {
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.themeLightIndigo()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let productTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "This is a title test"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Price $2.0"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    private let productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "This is a description label test"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private func setupViews() {
        backgroundColor = .groupTableViewBackground
        addSubview(containerView)
        containerView.addSubview(productImageView)
        containerView.addSubview(productTitleLabel)
        containerView.addSubview(productDescriptionLabel)
        
        containerView.anchorConstraints(topAnchor: topAnchor, topConstant: 10, leftAnchor: leftAnchor, leftConstant: 10, rightAnchor: rightAnchor, rightConstant: -10, bottomAnchor: bottomAnchor, bottomConstant: -5, heightConstant: 0, widthConstant: 0)
        
        productImageView.anchorConstraints(topAnchor: containerView.topAnchor, topConstant: 15, leftAnchor: containerView.leftAnchor, leftConstant: 8, rightAnchor: nil, rightConstant:0, bottomAnchor: containerView.bottomAnchor, bottomConstant: -15, heightConstant: 0, widthConstant: 70)
        
        productTitleLabel.anchorConstraints(topAnchor: productImageView.topAnchor, topConstant: 4, leftAnchor: productImageView.rightAnchor, leftConstant: 10, rightAnchor: containerView.rightAnchor, rightConstant: -5, bottomAnchor: nil, bottomConstant: 0, heightConstant: 0, widthConstant: 0)
        
        productDescriptionLabel.anchorConstraints(topAnchor: productTitleLabel.bottomAnchor, topConstant: 5, leftAnchor: productImageView.rightAnchor, leftConstant: 10, rightAnchor: containerView.rightAnchor, rightConstant: -5, bottomAnchor: nil, bottomConstant: 0, heightConstant: 0, widthConstant: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
