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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCell", for: indexPath)
        cell.backgroundColor = .themeColor()
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
            return CGSize(width: superView.frame.width, height: 100)
        } else {
            return CGSize.zero
        }
    }
}

extension DetailProductDataProvider: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let superView = collectionView.superview {
            switch indexPath.row {
            case 0:
                return CGSize(width: superView.frame.width, height: 150)
            case 1:
                return CGSize(width: superView.frame.width, height: 150)
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
}


class PhotosHeaderCell: BaseCollectionViewCell {
  
    override func setup() {
        backgroundColor = UIColor.yellow
    }
}


//extension DetailProductDataProvider: UITableViewDataSource {
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 3
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailProductCell", for: indexPath)
//        return cell
//    }
//}
//
//extension DetailProductDataProvider: UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        switch section {
//        case 0:
//            return 0
//        default:
//            return 15
//        }
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView()
//        view.backgroundColor = UIColor.groupTableViewBackground
//        return view
//    }
//}










