//
//  OrdersViewController.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-19.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit

class OrdersViewController: UIViewController {

    @IBOutlet weak var learnMoreButton: UIButton!
    @IBOutlet weak var manageOrderLabel: UILabel! {
        didSet {
            let attributedText = NSMutableAttributedString(string: "Manage Orders", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
            attributedText.append(NSAttributedString(string: "\n\n", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 4)]))
            attributedText.append(NSAttributedString(string: " You'll get notified when you receive your first order", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)]))
            manageOrderLabel.attributedText = attributedText
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func learnMoreButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: StoryBoardSegueIdentifiers.ordersSegueId.rawValue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navController = segue.destination as? UINavigationController {
            guard let webVC = navController.viewControllers.first as? WebViewController else {
                return
            }
            webVC.urlString = "https://www.shopify.com/guides/make-your-first-ecommerce-sale"
        }
    }
}
