//
//  ProductsDataProvider.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-19.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import Foundation
import UIKit

protocol ProductsDelegate: class  {
    func showAllProducts()
}

class ProductsDataProvider: NSObject {
    
    private let productsCellId = "ProductCell"

    var productManager: ProductManager?
    
    var recentProductsDataProvider: RecentProductsDataProvider?
    
    weak var productsDelegate: ProductsDelegate?
    
    override init() {
        super.init()
        productManager = ProductManager()
        recentProductsDataProvider = RecentProductsDataProvider()
    }
}

extension ProductsDataProvider: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: productsCellId, for: indexPath) as! ProductsTableViewCell
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                cell.imageView?.image = #imageLiteral(resourceName: "product_icon_purple")
                cell.textLabel?.text = "All products"
                cell.accessoryType = .disclosureIndicator
                cell.titleLabel.isHidden = true
                cell.viewAllButton.isHidden = true

            } else {
                cell.imageView?.image = #imageLiteral(resourceName: "product_icon_purple")
                cell.textLabel?.text = "Collections"
                cell.accessoryType = .disclosureIndicator
                cell.titleLabel.isHidden = true
                cell.viewAllButton.isHidden = true
            }
            
        case 1:
            if let collectionView = recentProductsDataProvider?.collectionView {
                cell.contentView.addSubview(collectionView)
                collectionView.anchorConstraints(topAnchor: cell.topAnchor, topConstant: 40, leftAnchor: cell.leftAnchor, leftConstant: 0, rightAnchor: cell.rightAnchor, rightConstant: 0, bottomAnchor: cell.bottomAnchor, bottomConstant: 0, heightConstant: 0, widthConstant: 0 )
                cell.titleLabel.isHidden = false
                cell.viewAllButton.isHidden = false
                cell.accessoryType = .none
                cell.selectionStyle = .none
            }
        default:
            cell.accessoryType = .none
            cell.selectionStyle = .none
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 1:
            return 200
        case 2:
            return 100
        default:
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        default:
            return 15
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.groupTableViewBackground
        return view
    }
}

extension ProductsDataProvider: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                productsDelegate?.showAllProducts()
                tableView.deselectRow(at: indexPath, animated: false)
            } else {
                print("row 2 tapped")
            }
        default:
            break
        }
    }
}







