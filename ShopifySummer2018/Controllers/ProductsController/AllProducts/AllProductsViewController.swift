//
//  AllProductsViewController.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-20.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit

class AllProductsViewController: UIViewController {
    
    private let productCellId = "AllProductsCell"
    
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
        sc.obscuresBackgroundDuringPresentation = false
        sc.dimsBackgroundDuringPresentation = false
        sc.definesPresentationContext = true
        sc.searchBar.placeholder = "Search"
        sc.searchBar.barTintColor = .groupTableViewBackground
        sc.searchBar.backgroundImage = UIImage()
        sc.searchBar.delegate = self
        return sc
    }()
    
    var productManager: ProductManager?
    
    var navigationTitle = "All products"
    
    var filteredProducts = [Product]()
    
    var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableHeaderView = searchController.searchBar
        
        productManager = ProductManager()
        setupViews()
        getProducts(fromService: ProductServiceApi())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func getProducts<S: Gettable>(fromService service: S) where S.T == Array<Product?> {
        service.get { [weak self] (result) in
            switch result {
            case .error(let error):
                print(error)
                return
            case .success(let products):
                let _ = products.map({ product in
                    if let product = product {
                        self?.productManager?.addProduct(product)
                        self?.products.append(product)
                        self?.filteredProducts.append(product)
                        self?.tableView.reloadData()
                    }
                })
            }
        }
    }
    
    private func isSearchEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true || searchController.searchBar.text == ""
    }

    private func setupViews() {
        view.backgroundColor = .groupTableViewBackground
        view.addSubview(tableView)
        tableView.anchorConstraints(topAnchor: view.topAnchor, topConstant: 0, leftAnchor: view.leftAnchor, leftConstant: 0, rightAnchor: view.rightAnchor, rightConstant: 0, bottomAnchor: view.bottomAnchor, bottomConstant: 0, heightConstant: 0, widthConstant: 0)
        
        navigationItem.title = navigationTitle
        navigationController?.navigationBar.tintColor = .white
    }
}

extension AllProductsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: productCellId, for: indexPath) as! AllProductsTableViewCell
        cell.selectionStyle = .none
        cell.product = filteredProducts[indexPath.row]
        return cell
    }
}

extension AllProductsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = filteredProducts[indexPath.row]
        let detailedVC = DetailProductViewController()
        detailedVC.product = product
        searchController.searchBar.resignFirstResponder()
        searchController.isActive = false
        navigationController?.pushViewController(detailedVC, animated: true)
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
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        filteredProducts = products
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if isSearchEmpty() {
            filteredProducts = products
        } else {
            filteredProducts = products.filter({ $0.title.lowercased().contains(searchText.lowercased())})
        }
        tableView.reloadData()
    }
}











