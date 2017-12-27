//
//  PhotosHeaderCell.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-20.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit

protocol PhotoHeaderCellDelegate: class {
    func didTapPhoto(with image: UIImage)
}

class PhotosHeaderCell: BaseCollectionViewCell {
    
    weak var delegate: PhotoHeaderCellDelegate?
    
    var product: Product? {
        didSet {
            guard let imageUrl = product?.imageUrl else {
                return
            }
            imageView.loadImageCach(with: imageUrl, completion: nil)
        }
    }
    
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
    
    private lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = UIColor.themeColor()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 5
        iv.layer.masksToBounds = true
        iv.isUserInteractionEnabled = true
        iv.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(imageTapped(_:))))
        return iv
    }()
   
    @objc
    private func imageTapped(_ gesture: UITapGestureRecognizer) {
        let imageView = gesture.view as? UIImageView
        guard let image = imageView?.image else {
            print("image is nil")
            return
        }
        delegate?.didTapPhoto(with: image)
    }
    
    override func setup() {
        addSubview(imageView)
        addSubview(collectionView)
        imageView.anchorConstraints(topAnchor: topAnchor, topConstant: 0, leftAnchor: leftAnchor, leftConstant: 20, rightAnchor: nil, rightConstant: 0, bottomAnchor: bottomAnchor, bottomConstant: 0, heightConstant: 0, widthConstant: 80)
    }
}











