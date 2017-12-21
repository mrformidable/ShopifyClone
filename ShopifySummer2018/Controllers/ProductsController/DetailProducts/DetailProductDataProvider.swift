//
//  ProductDetailDataProvider.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-20.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit

class DetailProductDataProvider: NSObject {
    
    override init() {
        super.init()
    }
}

extension DetailProductDataProvider: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
        case 1:
            return 5
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell!
        switch indexPath.section {
        case 0:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstDetailCell", for: indexPath) as! FirstDetailCell
        case 1:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondDetailCell", for: indexPath) as! SecondDetailCell
        case 2:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThirdDetailCell", for: indexPath) as! ThirdDetailCell
        default:
            cell = UICollectionViewCell()
        }
        return cell
    }
   
}

extension DetailProductDataProvider: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
           let photosHeaderSection = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "photosHeaderCellId", for: indexPath) as! BaseCollectionViewCell
        
        return photosHeaderSection
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if let superView = collectionView.superview {
            if section == 0 {
                return CGSize(width: superView.frame.width, height: 100)
            } else {
                return CGSize.zero
            }
        } else {
            return CGSize.zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}

extension DetailProductDataProvider: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let superView = collectionView.superview {
            switch indexPath.section {
            case 0:
                return CGSize(width: superView.frame.width, height: 50)
            case 1:
                return CGSize(width: superView.frame.width, height: 50)
            case 2:
                return CGSize(width: superView.frame.width, height: 90)
            default:
                break
            }
            return CGSize(width: superView.frame.width, height: 150)
        } else {
            return CGSize.zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}






