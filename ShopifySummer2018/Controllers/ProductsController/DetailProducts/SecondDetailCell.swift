//
//  SecondDetailCell.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-20.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit

class SecondDetailCell: BaseCollectionViewCell {
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "shipment_icon")
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 5
        iv.layer.masksToBounds = true
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 1
        let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor: UIColor.lightGray]
        let attributedString = NSMutableAttributedString(string: "Title Test 1", attributes: attributes)
        title.attributedText = attributedString
        return title
    }()
    
    private let subTitleLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 1
        title.font = UIFont.systemFont(ofSize: 15)
        title.text = "Test Subtitle Label"
        return title
    }()
    
    private let detailButton: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "detail_icon"), for: .normal)
        return btn
    }()
    
    private let seperatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = .seperatorColor()
        return view
    }()
    
    override func setup() {
        backgroundColor = .white
        
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(detailButton)
        addSubview(seperatorLine)
        
        imageView.anchorConstraints(topAnchor: nil, topConstant: 0, leftAnchor: leftAnchor, leftConstant: 8, rightAnchor: nil, rightConstant: 0, bottomAnchor: nil, bottomConstant: 0, heightConstant: 20, widthConstant: 20)
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        
        titleLabel.anchorConstraints(topAnchor: topAnchor, topConstant: 4, leftAnchor: imageView.rightAnchor, leftConstant: 10, rightAnchor: nil, rightConstant: 0, bottomAnchor: nil, bottomConstant: 0, heightConstant: 0, widthConstant: 0)
        
        subTitleLabel.anchorConstraints(topAnchor: titleLabel.bottomAnchor, topConstant: 5, leftAnchor: imageView.rightAnchor, leftConstant: 10, rightAnchor: nil, rightConstant: 0, bottomAnchor: nil, bottomConstant: 0, heightConstant: 0, widthConstant: 0)
        
        detailButton.anchorConstraints(topAnchor: nil, topConstant: 0, leftAnchor: nil, leftConstant: 0, rightAnchor: rightAnchor, rightConstant: -10, bottomAnchor: nil, bottomConstant: 0, heightConstant: 20, widthConstant: 20)
        detailButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        
        seperatorLine.anchorConstraints(topAnchor: nil, topConstant: 0, leftAnchor: imageView.rightAnchor, leftConstant: 0, rightAnchor: rightAnchor, rightConstant: 0, bottomAnchor: bottomAnchor, bottomConstant: 0, heightConstant: 0.5, widthConstant: 0)
    }
    
}
