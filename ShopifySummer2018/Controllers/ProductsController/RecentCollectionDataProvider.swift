//
//  RecentCollectionDataProvider.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-23.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import Foundation
import UIKit

class RecentCollectionDataProvider: NSObject {
    
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
    
}

extension RecentCollectionDataProvider: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: recentCollectionId, for: indexPath) as! RecentCollectionCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
}

extension RecentCollectionDataProvider: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 100)
    }
}
