//
//  ProductManager.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-19.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import Foundation

public struct ProductManager {
    var productsCount: Int { return products.count }
    var products = [Product]()
    
    func product(at index: Int) -> Product {
        return products[index]
    }
    
    mutating func addProduct(_ product: Product) {
        if !products.contains(product) {
            products.append(product)
        }
    }
    
    mutating func removeProduct(at index: Int) {
        products.remove(at: index)
    }
    
    mutating func removeAllProducts() {
        products.removeAll()
    }
}

