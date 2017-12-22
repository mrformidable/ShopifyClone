//
//  ProductDetailDataProvider.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-20.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit

class DetailProductDataProvider: NSObject {
    
    let secondDetailItems: [SecondDetailItems] = {
        let sales = SecondDetailItems(title: .salesTitle, subTitle: .salesSubtitle, image: #imageLiteral(resourceName: "sales_channel_icon"))
        let inventory = SecondDetailItems(title: .inventoryTitle, subTitle: .inventorySubtitle, image: #imageLiteral(resourceName: "inventory_icon"))
        let shipping = SecondDetailItems(title: .shippingTitle, subTitle: .shippingSubtitle, image: #imageLiteral(resourceName: "shipment_icon"))
        let organization = SecondDetailItems(title: .organizationTitle, subTitle: .organizationSubTitle, image: #imageLiteral(resourceName: "organization_icon"))
        let collection = SecondDetailItems(title: .collectionsTitle, subTitle: .collectionsSubtitle, image: #imageLiteral(resourceName: "product_icon_purple"))
        return [sales, inventory, shipping, organization, collection]
    }()
    
    override init() {
        super.init()
    }
}

extension DetailProductDataProvider: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 5
        case 3:
            return 1
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell!
        switch indexPath.section {
        case 0:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photosHeaderCellId", for: indexPath) as! PhotosHeaderCell
        case 1:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstDetailCell", for: indexPath) as! FirstDetailCell
        case 2:
           let secondCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondDetailCell", for: indexPath) as! SecondDetailCell
            secondCell.secondDetailItem = secondDetailItems[indexPath.item]
            return secondCell
        case 3:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThirdDetailCell", for: indexPath) as! ThirdDetailCell
        default:
            cell = UICollectionViewCell()
        }
        return cell
    }
   
}

extension DetailProductDataProvider: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//           let photosHeaderSection = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "photosHeaderCellId", for: indexPath) as! BaseCollectionViewCell
//
//        return photosHeaderSection
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        if let superView = collectionView.superview {
//            if section == 0 {
//                return CGSize(width: superView.frame.width, height: 100)
//            } else {
//                return CGSize.zero
//            }
//        } else {
//            return CGSize.zero
//        }
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}

extension DetailProductDataProvider: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let superView = collectionView.superview {
            switch indexPath.section {
            case 0:
                return CGSize(width: superView.frame.width, height: 80)
            case 1:
                return CGSize(width: superView.frame.width, height: 180)
            case 2:
                return CGSize(width: superView.frame.width, height: 50)
            case 3:
                return CGSize(width: superView.frame.width, height: 100)
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


