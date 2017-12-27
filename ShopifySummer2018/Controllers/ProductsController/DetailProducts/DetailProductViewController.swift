//
//  ProductDetailViewController.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-20.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit

class DetailProductViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: UITableViewStyle.plain)
        tv.backgroundColor = .groupTableViewBackground
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "DetailProductCell")
        return tv
    }()
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 0, 15, 0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.scrollIndicatorInsets = UIEdgeInsetsMake(10, 0, 15, 0)
        cv.backgroundColor = UIColor.groupTableViewBackground
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(FirstDetailCell.self, forCellWithReuseIdentifier: "FirstDetailCell")
        cv.register(SecondDetailCell.self, forCellWithReuseIdentifier: "SecondDetailCell")
        cv.register(ThirdDetailCell.self, forCellWithReuseIdentifier: "ThirdDetailCell")
        cv.register(PhotosHeaderCell.self, forCellWithReuseIdentifier: "photosHeaderCellId")
        return cv
    }()
    
    private let secondDetailItems: [SecondDetailItems] = {
        let sales = SecondDetailItems(title: .salesTitle, subTitle: .salesSubtitle, image: #imageLiteral(resourceName: "sales_channel_icon"))
        let inventory = SecondDetailItems(title: .inventoryTitle, subTitle: .inventorySubtitle, image: #imageLiteral(resourceName: "inventory_icon"))
        let shipping = SecondDetailItems(title: .shippingTitle, subTitle: .shippingSubtitle, image: #imageLiteral(resourceName: "shipment_icon"))
        let organization = SecondDetailItems(title: .organizationTitle, subTitle: .organizationSubTitle, image: #imageLiteral(resourceName: "organization_icon"))
        let collection = SecondDetailItems(title: .collectionsTitle, subTitle: .collectionsSubtitle, image: #imageLiteral(resourceName: "product_icon_purple"))
        return [sales, inventory, shipping, organization, collection]
    }()
    
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        tableView.keyboardDismissMode = .onDrag
        navigationItem.title = product?.title
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.anchorConstraints(topAnchor: view.topAnchor, topConstant: 0, leftAnchor: view.leftAnchor, leftConstant: 0, rightAnchor: view.rightAnchor, rightConstant: 0, bottomAnchor: view.bottomAnchor, bottomConstant: 0, heightConstant: 0, widthConstant: 0)
    }
}

extension DetailProductViewController: UICollectionViewDataSource {
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photosHeaderCellId", for: indexPath) as! PhotosHeaderCell
            cell.product = product
            cell.delegate = self
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstDetailCell", for: indexPath) as! FirstDetailCell
            cell.product = product
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondDetailCell", for: indexPath) as! SecondDetailCell
            cell.secondDetailItem = secondDetailItems[indexPath.item]
            return cell
        case 3:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThirdDetailCell", for: indexPath) as! ThirdDetailCell
        default:
            cell = UICollectionViewCell()
        }
        return cell
    }
    
}

extension DetailProductViewController: UICollectionViewDelegate {
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

extension DetailProductViewController: UICollectionViewDelegateFlowLayout {
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

extension DetailProductViewController: PhotoHeaderCellDelegate {
    func didTapPhoto(with image: UIImage) {
        let detailPhotoVC = DetailPhotoViewController()
        detailPhotoVC.image = image
        let navController = UINavigationController(rootViewController: detailPhotoVC)
        present(navController, animated: true, completion: nil)
    }
    
}







