//
//  FirstDetailCell.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-20.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit

class FirstDetailCell: BaseCollectionViewCell {
    
    var product: Product? {
        didSet {
            guard let title = product?.title, let description = product?.description else {
                return
            }
            titleLabel.text = title
            titleTextField.text = title
            descriptionLabel.text = description
            descriptionTextField.text = description
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    private let titleTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = UITextBorderStyle.none
        tf.text = "Title here"
        tf.font = UIFont.systemFont(ofSize: 15)

        return tf
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    private let descriptionTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = UITextBorderStyle.none
        tf.text = "Description here"
        tf.font = UIFont.systemFont(ofSize: 15)
        return tf
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Price"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    private let priceTextField: UITextField = {
        let tf = UITextField()
        tf.text = "$0.00"
        tf.keyboardType = UIKeyboardType.decimalPad
        tf.borderStyle = UITextBorderStyle.none
        tf.font = UIFont.systemFont(ofSize: 15)
        return tf
    }()
    
    private let comparePriceLabel: UILabel = {
        let label = UILabel()
        label.text = "Compare at price"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    private let comparePriceTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = UITextBorderStyle.none
        tf.text = "$0.00"
        tf.keyboardType = UIKeyboardType.decimalPad
        tf.font = UIFont.systemFont(ofSize: 15)

        return tf
    }()
    
    private let chargeTaxesLabel: UILabel = {
        let label = UILabel()
        label.text = "Charge Taxes"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.black
        return label
    }()
    
    private let chargeTaxSwitch: UISwitch = {
        let chargeSwitch = UISwitch()
        chargeSwitch.isOn = false
        chargeSwitch.onTintColor = UIColor.themeColor()
        return chargeSwitch
    }()
    
    private let titleSeparatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = .seperatorColor()
        return view
    }()
    
    private let descriptionSeparatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = .seperatorColor()
        return view
    }()
    
    private let priceSeparatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = .seperatorColor()
        return view
    }()
    
    private let comparePriceSeparatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = .seperatorColor()
        return view
    }()
    
    override func setup() {
        backgroundColor = .white
        addSubview(titleLabel)
        addSubview(titleTextField)
        addSubview(titleSeparatorLine)
        addSubview(descriptionLabel)
        addSubview(descriptionTextField)
        addSubview(descriptionSeparatorLine)
        addSubview(priceLabel)
        addSubview(priceTextField)
        addSubview(priceSeparatorLine)
        addSubview(comparePriceLabel)
        addSubview(comparePriceTextField)
        addSubview(comparePriceSeparatorLine)
        addSubview(chargeTaxesLabel)
        addSubview(chargeTaxSwitch)

        
        titleLabel.anchorConstraints(topAnchor: topAnchor, topConstant: 4, leftAnchor: leftAnchor, leftConstant: 8, rightAnchor: nil, rightConstant: 0, bottomAnchor: nil, bottomConstant: 0, heightConstant: 0, widthConstant: 0)
        
        titleTextField.anchorConstraints(topAnchor: titleLabel.bottomAnchor, topConstant: 2, leftAnchor: leftAnchor, leftConstant: 8, rightAnchor: rightAnchor, rightConstant: -8, bottomAnchor: nil, bottomConstant: 0, heightConstant: 0, widthConstant: 0)
        
        titleSeparatorLine.anchorConstraints(topAnchor: titleTextField.bottomAnchor, topConstant: 1, leftAnchor: leftAnchor, leftConstant: 10, rightAnchor: rightAnchor, rightConstant: 0, bottomAnchor: nil, bottomConstant: 0, heightConstant: 0.5, widthConstant: 0)
        
        descriptionLabel.anchorConstraints(topAnchor: titleSeparatorLine.bottomAnchor, topConstant: 5, leftAnchor: leftAnchor, leftConstant: 8, rightAnchor: nil, rightConstant: 0, bottomAnchor: nil, bottomConstant: 0, heightConstant: 0, widthConstant: 0)
        
        descriptionTextField.anchorConstraints(topAnchor: descriptionLabel.bottomAnchor, topConstant: 4, leftAnchor: leftAnchor, leftConstant: 8, rightAnchor: rightAnchor, rightConstant: -8, bottomAnchor: nil, bottomConstant: 0, heightConstant: 0, widthConstant: 0)
        
        descriptionSeparatorLine.anchorConstraints(topAnchor: descriptionTextField.bottomAnchor, topConstant: 1, leftAnchor: leftAnchor, leftConstant: 0, rightAnchor: rightAnchor, rightConstant: 0, bottomAnchor: nil, bottomConstant: 0, heightConstant: 0.5, widthConstant: 0)

        priceLabel.anchorConstraints(topAnchor: descriptionSeparatorLine.bottomAnchor, topConstant: 10, leftAnchor: leftAnchor, leftConstant: 8, rightAnchor: nil, rightConstant: 0, bottomAnchor: nil, bottomConstant: 0, heightConstant: 0, widthConstant: 100)

        priceTextField.anchorConstraints(topAnchor: priceLabel.bottomAnchor, topConstant: 0, leftAnchor: leftAnchor, leftConstant: 8, rightAnchor: nil, rightConstant: 0, bottomAnchor: nil, bottomConstant: 0, heightConstant: 0, widthConstant: 100)
        
        priceSeparatorLine.anchorConstraints(topAnchor: priceTextField.bottomAnchor, topConstant: 1, leftAnchor: leftAnchor, leftConstant: 0, rightAnchor: nil, rightConstant: 0, bottomAnchor: nil, bottomConstant: 0, heightConstant: 0.5, widthConstant: 100)

        
        comparePriceLabel.anchorConstraints(topAnchor: descriptionSeparatorLine.bottomAnchor, topConstant: 10, leftAnchor: nil, leftConstant: 8, rightAnchor: rightAnchor, rightConstant: -8, bottomAnchor: nil, bottomConstant: 0, heightConstant: 0, widthConstant: 100)

        comparePriceTextField.anchorConstraints(topAnchor: comparePriceLabel.bottomAnchor, topConstant: 0, leftAnchor: nil, leftConstant: 0, rightAnchor: rightAnchor, rightConstant: -8, bottomAnchor: nil, bottomConstant: 0, heightConstant: 0, widthConstant: 100)
        
        comparePriceSeparatorLine.anchorConstraints(topAnchor: comparePriceTextField.bottomAnchor, topConstant: 1, leftAnchor: nil, leftConstant: 0, rightAnchor: rightAnchor, rightConstant: -8, bottomAnchor: nil, bottomConstant: 0, heightConstant: 0.5, widthConstant: 100)

        chargeTaxesLabel.anchorConstraints(topAnchor: nil, topConstant: 0, leftAnchor: leftAnchor, leftConstant: 8, rightAnchor: nil, rightConstant: 0, bottomAnchor: bottomAnchor, bottomConstant: -13, heightConstant: 0, widthConstant: 0)

        chargeTaxSwitch.anchorConstraints(topAnchor: nil, topConstant: 0, leftAnchor: nil, leftConstant: 0, rightAnchor: rightAnchor, rightConstant: -10, bottomAnchor: bottomAnchor, bottomConstant: -10, heightConstant: 0, widthConstant: 0)
    }
}




















