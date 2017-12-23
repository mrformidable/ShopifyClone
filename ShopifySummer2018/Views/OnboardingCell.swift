//
//  OnboardingCell.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-22.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "store_image")
        return iv
    }()
    
    let onboardingLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.textAlignment = .center
        label.text = "Grow your business on the go with the Shopify App"
        label.textColor = .lightGray
        label.font = UIFont.init(name: "Avenir", size: 20)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        imageView.anchorConstraints(topAnchor: topAnchor, topConstant: 0, leftAnchor: leftAnchor, leftConstant: 0, rightAnchor: rightAnchor, rightConstant: 0, bottomAnchor: bottomAnchor, bottomConstant: 0, heightConstant: 0, widthConstant: 0)
        
        addSubview(onboardingLabel)
        onboardingLabel.anchorConstraints(topAnchor: topAnchor, topConstant: 40, leftAnchor: leftAnchor, leftConstant: 20, rightAnchor: nil, rightConstant: 0, bottomAnchor: nil, bottomConstant: 0, heightConstant: 0, widthConstant: 0)
        onboardingLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
