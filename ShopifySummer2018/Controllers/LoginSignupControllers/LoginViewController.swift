//
//  LoginViewController.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-22.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailAlertLabel: UILabel!
    
    @IBOutlet weak var passwordAlertLabel: UILabel!
    
    @IBOutlet weak var emailDividerView: UIView!
    
    @IBOutlet weak var passwordDividerView: UIView!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavTitleView()
        setupViews()
    }
    
    @objc
    func handleEmailTextFieldEditing() {
        let invalidEmail = emailTextField.text?.characters.count ?? 0 > 0
        if !invalidEmail {
            createAlertAnimation(message: "Email is required to log in", alertLabel: emailAlertLabel, dividerView: emailDividerView)
            emailTextField.shake()
        }
    }
    
    @objc
    func handlePasswordTextFieldEditing() {
        let invalidPassword = passwordTextField.text?.characters.count ?? 0 > 0
        if !invalidPassword {
            passwordTextField.shake()
            createAlertAnimation(message: "Password is required to log in", alertLabel: passwordAlertLabel, dividerView: passwordDividerView)
        }
    }
    
    func createAlertAnimation(message: String, alertLabel: UILabel, dividerView: UIView) {
        alertLabel.text = message
        playVibrationSound()
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            alertLabel.alpha = 1
            dividerView.backgroundColor = .red
        }, completion: { _ in
            UIView.animate(withDuration: 0.8, delay: 1, options: .curveEaseIn, animations: {
                alertLabel.alpha = 0
                dividerView.backgroundColor = .dividerLineColor()
            }, completion: nil)
        })
    }
    
    private func setupNavTitleView() {
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "shopify_logo_white"))
        titleImageView.contentMode = .scaleAspectFill
        navigationItem.titleView = titleImageView
    }
    
    
    private func setupViews() {
        loginButton.layer.cornerRadius = 23
        emailAlertLabel.alpha = 0
        passwordAlertLabel.alpha = 0
        emailTextField.addTarget(self, action: #selector(handleEmailTextFieldEditing), for: .editingDidEnd)
        passwordTextField.addTarget(self, action: #selector(handlePasswordTextFieldEditing), for: .editingDidEnd)
        emailTextField.becomeFirstResponder()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapView)))
    }
    
    @objc
    private func didTapView() {
        view.endEditing(true)
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let tabBarController = storyBoard.instantiateViewController(withIdentifier: "MainTabBarController") as? UITabBarController else {
            fatalError("Failure to instantiate TabBar Controller with identifer of MainTabBarController")
        }
        present(tabBarController, animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
}
