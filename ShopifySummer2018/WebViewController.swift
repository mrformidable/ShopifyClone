//
//  WebViewController.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-22.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    var urlString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUrl()
    }
    
    private func loadUrl() {
        guard let urlString = urlString ,let url = URL.init(string: urlString) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.new, context: nil)
        navigationItem.title =  "Shopify"
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func refreshButtonTapped(_ sender: Any) {
        webView.reload()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let _webView = webView else { return }
        progressView.alpha = 1
        
        if keyPath == "estimatedProgress" {
            let progress = Float(_webView.estimatedProgress)
            progressView.setProgress(progress, animated: true)
            if progress >= 1.0 {
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.curveEaseInOut], animations: {
                    self.progressView.alpha = 0
                }, completion: { _ in
                    self.progressView.progress = 0
                })
            }
        }
    }
}






