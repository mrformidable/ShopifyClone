//
//  ProductsDataProvider.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-19.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import Foundation

class ProductsDataProvider: NSObject {
    var productManager: ProductManager?
    
    override init() {
        super.init()
        productManager = ProductManager()
    }
}
