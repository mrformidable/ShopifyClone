//
//  FirstDetailCell.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-20.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit

class FirstDetailCell: BaseCollectionViewCell {
    
    private let seperatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = .seperatorColor()
        return view
    }()
    
    override func setup() {
        backgroundColor = .white
        
        seperatorLine.anchorConstraints(topAnchor: nil, topConstant: 0, leftAnchor: leftAnchor, leftConstant: 10, rightAnchor: rightAnchor, rightConstant: 0, bottomAnchor: bottomAnchor, bottomConstant: 0, heightConstant: 0.5, widthConstant: 0)
    }
}
