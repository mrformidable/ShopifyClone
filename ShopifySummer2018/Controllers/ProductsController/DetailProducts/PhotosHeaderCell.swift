//
//  PhotosHeaderCell.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-20.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit

class PhotosHeaderCell: BaseCollectionViewCell {
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.backgroundColor = UIColor.cyan
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ImagesCell")
        return cv
    }()
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = UIColor.red
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 5
        iv.layer.masksToBounds = true
        return iv
    }()
    
   
    override func setup() {
        backgroundColor = UIColor.yellow
        addSubview(imageView)
        addSubview(collectionView)
        //imageView.anchorConstraints(topAnchor: <#T##NSLayoutYAxisAnchor?#>, topConstant: <#T##CGFloat#>, leftAnchor: <#T##NSLayoutXAxisAnchor?#>, leftConstant: <#T##CGFloat#>, rightAnchor: <#T##NSLayoutXAxisAnchor?#>, rightConstant: <#T##CGFloat#>, bottomAnchor: <#T##NSLayoutYAxisAnchor?#>, bottomConstant: <#T##CGFloat#>, heightConstant: <#T##CGFloat#>, widthConstant: <#T##CGFloat#>)
    }
}

