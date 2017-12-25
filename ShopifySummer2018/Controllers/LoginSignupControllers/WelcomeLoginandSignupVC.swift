//
//  WelcomeLoginandSignupVC.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-22.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit

class WelcomeLoginandSignupVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var signUpButton: UIButton! {
        didSet {
            let attributedText = NSMutableAttributedString(string: "New to Shopify? Try it for free.", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedStringKey.foregroundColor: UIColor.black])
            attributedText.append(NSAttributedString(string: "\n\n", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 4)]))
            attributedText.append(NSAttributedString(string: "Sign up", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedStringKey.foregroundColor: UIColor.themeIndigo()]))
            signUpButton.setAttributedTitle(attributedText, for: .normal)
            signUpButton.titleLabel?.numberOfLines = 4
            signUpButton.titleLabel?.textAlignment = .center
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createParallaxMotionEffect(view: imageView, magnitude: -30)
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: StoryBoardSegueIdentifiers.loginSegueId.rawValue, sender: self)
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: StoryBoardSegueIdentifiers.signupSegueId.rawValue, sender: self)
    }
}
