//
//  AllProductsDataProvider.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-20.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit

protocol AllProductsDelegate: class  {
    func showDetailedProduct()
}

class AllProductsDataProvider: NSObject {
    
    private let productCellId = "AllProductsCell"
    
    var productManager: ProductManager?
    
    weak var allProductsDelegate: AllProductsDelegate?
    
    override init() {
        super.init()
        productManager = ProductManager()
    }
}

extension AllProductsDataProvider: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: productCellId, for: indexPath) as! AllProductsTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    
}

extension AllProductsDataProvider: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        allProductsDelegate?.showDetailedProduct()
    }
}








