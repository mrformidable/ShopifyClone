//
//  ProductsViewController.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-19.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var productsDataProvider: ProductsDataProvider!
    @IBOutlet var recentProductsDataProvider: RecentProductsDataProvider!
    
    private lazy var searchController: UISearchController = {
        let sc = UISearchController(searchResultsController: nil)
        sc.searchResultsUpdater = self
        sc.obscuresBackgroundDuringPresentation = true
        sc.dimsBackgroundDuringPresentation = true
        sc.definesPresentationContext = true
        sc.searchBar.placeholder = "Search"
        sc.searchBar.barTintColor = UIColor.groupTableViewBackground
        sc.searchBar.isTranslucent = false
        sc.searchBar.backgroundImage = UIImage()
        return sc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = productsDataProvider
        tableView.delegate = productsDataProvider
        tableView.tableHeaderView = searchController.searchBar
        productsDataProvider.productsDelegate = self
    }
    
}

extension ProductsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
}

extension ProductsViewController: ProductsDelegate {
    
    func showAllProducts() {
        let allProductsVC = AllProductsViewController()
        self.navigationController?.pushViewController(allProductsVC, animated: true)
    }
    
}







