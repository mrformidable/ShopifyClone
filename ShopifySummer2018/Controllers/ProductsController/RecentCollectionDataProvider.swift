//
//  RecentCollectionDataProvider.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-23.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import Foundation
import UIKit

public class RecentCollectionDataProvider: NSObject {
    
    private let recentCollectionId = "RecentCollectionsCell"
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.register(RecentCollectionCell.self, forCellWithReuseIdentifier: recentCollectionId)
        return cv
    }()
    
    var recentCollections: [FakeRecentCollectionModel]!
    
    override init() {
        super.init()
        recentCollections = FakeRecentCollectionsGenerator.createRecentCollections()
    }
    
}

extension RecentCollectionDataProvider: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: recentCollectionId, for: indexPath) as! RecentCollectionCell
        cell.recentCollection = recentCollections[indexPath.item]
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recentCollections.count
    }
}

extension RecentCollectionDataProvider: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 100)
    }
}


// For simplicity create hard coded collections
struct FakeRecentCollectionModel {
    let title: String
    let description: String
    let image: UIImage
}

struct FakeRecentCollectionsGenerator {
    static func createRecentCollections() -> [FakeRecentCollectionModel] {
        var products = [FakeRecentCollectionModel]()
        let coffeeJar = FakeRecentCollectionModel(title: "Coffee Jar", description: "", image: #imageLiteral(resourceName: "coffee_jar"))
        let woodenJar = FakeRecentCollectionModel(title: "Wooden Jar", description: "", image: #imageLiteral(resourceName: "wooden_jar"))
        let lamp = FakeRecentCollectionModel(title: "Lamp", description: "", image: #imageLiteral(resourceName: "lamp"))
        products = [coffeeJar, woodenJar, lamp]
        return products
    }
}

