//
//  RecentProductsDataProvider.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-19.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit

public class RecentProductsDataProvider: NSObject {
    
    private let recentProductsCellId = "RecentProductsCell"

    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.register(RecentProductsCollectionViewCell.self, forCellWithReuseIdentifier: recentProductsCellId)
        return cv
    }()
    
    var recentProducts: [FakeRecentProductsModel]!
    
    override init() {
        super.init()
        recentProducts = FakeRecentProductsGenerator.createRecentProducts()
    }
    
}

extension RecentProductsDataProvider: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: recentProductsCellId, for: indexPath) as! RecentProductsCollectionViewCell
        cell.recentProduct = recentProducts[indexPath.item]
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recentProducts.count
    }
}

extension RecentProductsDataProvider: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 100)
    }
}

// For simplicity create hard coded products
struct FakeRecentProductsModel {
    let title: String
    let description: String
    let image: UIImage
}

struct FakeRecentProductsGenerator {
    static func createRecentProducts() -> [FakeRecentProductsModel] {
        var products = [FakeRecentProductsModel]()
        let speakers = FakeRecentProductsModel(title: "Speakers", description: "", image: #imageLiteral(resourceName: "speakers"))
        let router = FakeRecentProductsModel(title: "Router", description: "", image: #imageLiteral(resourceName: "router"))
        let woodenGlass = FakeRecentProductsModel(title: "Wooden Glass", description: "", image: #imageLiteral(resourceName: "wooden_glass"))
        let clock = FakeRecentProductsModel(title: "Clock", description: "", image: #imageLiteral(resourceName: "clock"))
        products = [speakers, router, woodenGlass, clock]
        return products
    }
}















