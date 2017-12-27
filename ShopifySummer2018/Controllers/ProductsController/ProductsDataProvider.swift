//
//  ProductsDataProvider.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-19.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import Foundation
import UIKit

public protocol ProductsDelegate: class  {
    func showAllProducts()
    func showAllCollections()
}

public class ProductsDataProvider: NSObject {
    
    private let productsCellId = "ProductCell"
    
    var productManager: ProductManager?
    
    var recentProductsDataProvider: RecentProductsDataProvider?
    
    var recentCollectionDataProvider: RecentCollectionDataProvider?
    
    weak var productsDelegate: ProductsDelegate?
    
    override init() {
        super.init()
        productManager = ProductManager()
        recentProductsDataProvider = RecentProductsDataProvider()
        recentCollectionDataProvider = RecentCollectionDataProvider()
    }
}

extension ProductsDataProvider: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        default:
            return 1
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: productsCellId, for: indexPath) as! ProductsTableViewCell

        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                setupFirstCell(for: cell, image: #imageLiteral(resourceName: "product_icon_purple"), text: "All products")
            } else {
                setupFirstCell(for: cell, image: #imageLiteral(resourceName: "product_icon_purple"), text: "Collections")
            }
        case 1:
            setupRecentProductsCell(cell)
        case 2:
            setupRecentCollectionCell(for: cell)
        default:
            break
        }
        return cell
    }

    
    private func setupFirstCell(for cell: ProductsTableViewCell, image: UIImage, text: String) {
        cell.imageView?.image = #imageLiteral(resourceName: "product_icon_purple")
        cell.textLabel?.text = text
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
    }
    
    private func configueCell(_ cell: ProductsTableViewCell, title label: String) {
        cell.titleLabel.isHidden = false
        cell.viewAllButton.isHidden = false
        cell.accessoryType = .none
        cell.selectionStyle = .none
        cell.titleLabel.text = label
    }
    
    private func setupRecentProductsCell(_ cell: ProductsTableViewCell) {
        configueCell(cell, title: "Recently Edited Products")
        if let collectionView = recentProductsDataProvider?.collectionView {
            cell.contentView.addSubview(collectionView)
            collectionView.anchorConstraints(topAnchor: cell.topAnchor, topConstant: 40, leftAnchor: cell.leftAnchor, leftConstant: 0, rightAnchor: cell.rightAnchor, rightConstant: 0, bottomAnchor: cell.bottomAnchor, bottomConstant: 0, heightConstant: 0, widthConstant: 0 )
        }
    }
    
    private func setupRecentCollectionCell(for cell: ProductsTableViewCell) {
        configueCell(cell, title: "Recently Edited Collections")
        if let collectionView = recentCollectionDataProvider?.collectionView {
            cell.contentView.addSubview(collectionView)
            collectionView.anchorConstraints(topAnchor: cell.topAnchor, topConstant: 40, leftAnchor: cell.leftAnchor, leftConstant: 0, rightAnchor: cell.rightAnchor, rightConstant: 0, bottomAnchor: cell.bottomAnchor, bottomConstant: 0, heightConstant: 0, widthConstant: 0 )
        }
    }
    
   public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 1:
            return 200
        case 2:
            return 160
        default:
            return 50
        }
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        default:
            return 15
        }
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.groupTableViewBackground
        return view
    }
}

extension ProductsDataProvider: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                productsDelegate?.showAllProducts()
                tableView.deselectRow(at: indexPath, animated: false)
            } else {
                productsDelegate?.showAllCollections()
                tableView.deselectRow(at: indexPath, animated: false)
            }
        default:
            break
        }
    }
}


