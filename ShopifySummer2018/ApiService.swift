//
//  ApiService.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-24.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import Foundation

public enum Result<T> {
    case success(T)
    case error(String)
}

protocol Gettable {
    associatedtype T
    func get(completionHandler: @escaping (Result<T>) -> Void)
}

typealias jsonDictionary = [String: Any]

typealias jsonTaskCompletionHandler = (Result<jsonDictionary>) -> Void

public struct JSONDownloader {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration = .default) {
        self.session = URLSession(configuration: configuration)
    }
    
    func task(with request: URLRequest, completionHandler completion: @escaping jsonTaskCompletionHandler) -> URLSessionTask {
        let task = session.dataTask(with: request) { (data, response, error) in
            if error != nil {
                completion(.error(error!.localizedDescription))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.error("Error retreiving HTTP Response"))
                return
            }
            
            if httpResponse.statusCode == 200 {
                guard let data = data else {
                    completion(.error("Error retreiving data from web"))
                    return
                }
                guard let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! jsonDictionary else {
                    completion(.error("Error retreiving json"))
                    return
                }
                DispatchQueue.main.async {
                    completion(.success(json))
                }
            } else {
                completion(.error("Error connecting to API"))
                return
            }
        }
        return task
    }
}

public struct ProductServiceApi: Gettable {
    
    let endPoint = "https://shopicruit.myshopify.com/admin/products.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6"
    
    let downloader = JSONDownloader()
    
    typealias productCompletionHandler = (Result<[Product?]>) -> Void
    
    func get(completionHandler: @escaping productCompletionHandler) {
        guard let url = URL(string: endPoint) else {
            completionHandler(.error("Error retreving url"))
            return
        }
        let request = URLRequest(url: url)
        let task = downloader.task(with: request) { (result) in
             DispatchQueue.main.async {
                switch result {
                case .error:
                    completionHandler(.error("Error retreiving data from url sesssion"))
                    return
                case .success(let json):
                    guard let productJson = json["products"] as? [jsonDictionary] else {
                        return
                    }
                    productJson.forEach({
                        if let product = try? Product(jsonDictionary: $0) {
                            completionHandler(.success([product]))
                        }
                    })
                }
            }
        }
        task.resume()
    }
}









