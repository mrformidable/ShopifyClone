//
//  ProductsTableViewCell.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-19.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {

     let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Recently Edited Products"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
     lazy var viewAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("View all", for: .normal)
        let attributes = [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedStringKey.foregroundColor: UIColor.themePurple()]
        let attributedTitle = NSAttributedString(string: "View all", attributes: attributes)
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(titleLabel)
        titleLabel.anchorConstraints(topAnchor: topAnchor, topConstant: 9, leftAnchor: leftAnchor, leftConstant: 10, rightAnchor: nil, rightConstant: 0, bottomAnchor: nil, bottomConstant: 0, heightConstant: 0, widthConstant: 0)
        
        addSubview(viewAllButton)
        viewAllButton.anchorConstraints(topAnchor: topAnchor, topConstant: 5, leftAnchor: nil, leftConstant: 10, rightAnchor: rightAnchor, rightConstant: -6, bottomAnchor: nil, bottomConstant: 0, heightConstant: 0, widthConstant: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
