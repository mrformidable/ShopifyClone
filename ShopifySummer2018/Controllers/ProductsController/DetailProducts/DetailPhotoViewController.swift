//
//  DetailPhotoViewController.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-25.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit

class DetailPhotoViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = UIColor.themeColor()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = false
        return iv
    }()
    
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupNavItems()
    }
    
    private func setupViews() {
        view.addSubview(imageView)
        view.backgroundColor = UIColor.themeColor()
        imageView.anchorConstraints(topAnchor: nil, topConstant: 0, leftAnchor: nil, leftConstant: 0, rightAnchor: nil, rightConstant: 0, bottomAnchor: nil, bottomConstant: 0, heightConstant: 300, widthConstant: 300)
        imageView.anchorCenterConstraints(centerXAnchor: view.centerXAnchor, xConstant: 0, centerYAnchor: view.centerYAnchor, yConstant: 0)
        imageView.image = image
    }
    
    private func setupNavItems() {
        let leftNavBarItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTapped))
        navigationItem.leftBarButtonItem = leftNavBarItem
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = UIColor.themeIndigoDarker()
        navigationItem.title = "Preview Image"
        let titleAttribute = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = titleAttribute
    }
    
    @objc
    private func doneButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}










