//
//  Product.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-19.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import Foundation

struct Product {
    let productTitle: String
    let productDescription: String
    let productImageUrl: String
}

extension Product: Equatable {
    static func ==(lhs: Product, rhs: Product) -> Bool {
        if lhs.productTitle == rhs.productTitle && lhs.productDescription == rhs.productDescription && lhs.productImageUrl == rhs.productImageUrl {
            return true
        }
        return false
    }
}
