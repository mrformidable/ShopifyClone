//
//  StoreViewController.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-19.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController {

    @IBOutlet weak var manageStoreLabel: UILabel! {
        didSet {
            let attributedText = NSMutableAttributedString(string: "Manage Store", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
            attributedText.append(NSAttributedString(string: "\n\n", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 4)]))
            attributedText.append(NSAttributedString(string: " You'll see your store statistics when you create your store", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)]))
            manageStoreLabel.attributedText = attributedText
        }
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func learnMoreButton(_ sender: Any) {
    performSegue(withIdentifier: StoryBoardSegueIdentifiers.storeSegueId.rawValue, sender: self)
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navController = segue.destination as? UINavigationController {
            guard let webVC = navController.viewControllers.first as? WebViewController else {
                return
            }
            webVC.urlString = "https://www.shopify.ca/online"
        }
    }
}
