//
//  ProductDetailViewController.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-20.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit

class DetailProductViewController: UIViewController {
   
    private let detailProductDataProvider = DetailProductDataProvider()
   
    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: UITableViewStyle.plain)
        tv.backgroundColor = .groupTableViewBackground
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "DetailProductCell")
        return tv
    }()
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = UIEdgeInsetsMake(15, 0, 0, 0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.backgroundColor = UIColor.groupTableViewBackground
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.register(FirstDetailCell.self, forCellWithReuseIdentifier: "FirstDetailCell")
        cv.register(SecondDetailCell.self, forCellWithReuseIdentifier: "SecondDetailCell")
        cv.register(ThirdDetailCell.self, forCellWithReuseIdentifier: "ThirdDetailCell")
        cv.register(PhotosHeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "photosHeaderCellId")
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        collectionView.dataSource = detailProductDataProvider
        collectionView.delegate = detailProductDataProvider
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.anchorConstraints(topAnchor: view.topAnchor, topConstant: 0, leftAnchor: view.leftAnchor, leftConstant: 0, rightAnchor: view.rightAnchor, rightConstant: 0, bottomAnchor: view.bottomAnchor, bottomConstant: 0, heightConstant: 0, widthConstant: 0)
    }
}









