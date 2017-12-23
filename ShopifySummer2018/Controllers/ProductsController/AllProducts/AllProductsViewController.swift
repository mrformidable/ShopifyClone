//
//  AllProductsViewController.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-20.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit


class AllProductsViewController: UIViewController {
    
    private let allProductsDataProvider = AllProductsDataProvider()
    
    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: UITableViewStyle.plain)
        tv.separatorStyle = .none
        tv.backgroundColor = .groupTableViewBackground
        tv.register(AllProductsTableViewCell.self, forCellReuseIdentifier: "AllProductsCell")
        return tv
    }()
    
    private lazy var searchController: UISearchController = {
        let sc = UISearchController(searchResultsController: nil)
        sc.searchResultsUpdater = self
        sc.obscuresBackgroundDuringPresentation = true
        sc.dimsBackgroundDuringPresentation = true
        sc.definesPresentationContext = true
        sc.searchBar.placeholder = "Search"
        sc.searchBar.barTintColor = .groupTableViewBackground
        sc.searchBar.isTranslucent = false
        sc.searchBar.backgroundImage = UIImage()
        sc.searchBar.delegate = self
        return sc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = allProductsDataProvider
        tableView.delegate = allProductsDataProvider
        tableView.tableHeaderView = searchController.searchBar
        allProductsDataProvider.allProductsDelegate = self
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .groupTableViewBackground
        view.addSubview(tableView)
        tableView.anchorConstraints(topAnchor: view.topAnchor, topConstant: 0, leftAnchor: view.leftAnchor, leftConstant: 0, rightAnchor: view.rightAnchor, rightConstant: 0, bottomAnchor: view.bottomAnchor, bottomConstant: 0, heightConstant: 0, widthConstant: 0)
        navigationItem.title = "All Products"
        navigationController?.navigationBar.tintColor = .white
    }
}

extension AllProductsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

extension AllProductsViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        navigationController?.navigationBar.isTranslucent = true

    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        navigationController?.navigationBar.isTranslucent = false

    }
}

extension AllProductsViewController: AllProductsDelegate {
    
    func showDetailedProduct() {
        let detailedVC = DetailProductViewController()
        navigationController?.pushViewController(detailedVC, animated: true)
    }
    
}








