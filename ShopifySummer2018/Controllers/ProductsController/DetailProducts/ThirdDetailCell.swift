//
//  ThirdDetailCell.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-20.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit


class ThirdDetailCell: BaseCollectionViewCell {
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 1
        title.font = UIFont.boldSystemFont(ofSize: 14)
        title.text = "Variants"
        return title
    }()
    
    private let descriptionLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 2
        title.font = UIFont.systemFont(ofSize: 14)
        title.text = "Add variants if this product comes in multiple versions, like different sizes of colors"
        return title
    }()
    
    private let addVariantButton: UIButton = {
        let btn = UIButton()
        let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14), NSAttributedStringKey.foregroundColor: UIColor.themeIndigo()]
        let attributedTitle = NSAttributedString(string: "Add variants", attributes: attributes)
        btn.setAttributedTitle(attributedTitle, for: .normal)
        return btn
    }()
    
    override func setup() {
        backgroundColor = .white
        
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(addVariantButton)
        
        titleLabel.anchorConstraints(topAnchor: topAnchor, topConstant: 5, leftAnchor: leftAnchor, leftConstant: 8, rightAnchor: nil, rightConstant: 0, bottomAnchor: nil, bottomConstant: 0, heightConstant: 0, widthConstant: 0)
        
        descriptionLabel.anchorConstraints(topAnchor: titleLabel.bottomAnchor, topConstant: 5, leftAnchor: leftAnchor, leftConstant: 8, rightAnchor: rightAnchor, rightConstant: -5, bottomAnchor: nil, bottomConstant: 0, heightConstant: 0, widthConstant: 0)
        addVariantButton.anchorConstraints(topAnchor: descriptionLabel.bottomAnchor, topConstant: 5, leftAnchor: leftAnchor, leftConstant: 8, rightAnchor: nil, rightConstant: 0, bottomAnchor: bottomAnchor, bottomConstant: -8, heightConstant: 0, widthConstant: 0)
    }
}








