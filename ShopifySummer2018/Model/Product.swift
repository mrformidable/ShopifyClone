//
//  Product.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-19.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import Foundation

public enum SerializationError: Error {
    case missing(String)
    case invalid(String)
}

public struct Product {
    let title: String
    let description: String
    let imageUrl: String
}

private enum ProductSerializationKeys: String {
    case title = "title"
    case description = "body_html"
    case image = "image"
    case imageSource = "src"
}

extension Product {
    
    init(jsonDictionary: jsonDictionary) throws {
        guard let title = jsonDictionary[ProductSerializationKeys.title.rawValue] as? String else {
         throw SerializationError.missing("title")
        }
        guard let description = jsonDictionary[ProductSerializationKeys.description.rawValue] as? String else {
            throw SerializationError.missing("description")
        }
        guard let imageDict = jsonDictionary[ProductSerializationKeys.image.rawValue] as? jsonDictionary else {
            throw SerializationError.missing("image")
        }
        guard let imageUrl = imageDict[ProductSerializationKeys.imageSource.rawValue] as? String else {
            throw SerializationError.invalid("Image source for \(ProductSerializationKeys.imageSource.rawValue)")
        }
        self.title = title
        self.description = description
        self.imageUrl = imageUrl
    }
}



extension Product: Equatable {
    public static func ==(lhs: Product, rhs: Product) -> Bool {
        if lhs.title == rhs.title && lhs.description == rhs.description && lhs.imageUrl == rhs.imageUrl {
            return true
        }
        return false
    }
}

