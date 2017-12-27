//
//  HomeViewController.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-19.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var statsLabel: UILabel! 
    
    @IBOutlet weak var soldLabel: UILabel!
    
    private var pulseShapeLayer: CAShapeLayer!
    
    private var shapeLayer: CAShapeLayer!
    
    private lazy var shopifyIconView: UIImageView = {
        let view = UIImageView()
        view.frame.size = CGSize(width: 40, height: 40)
        view.center = self.view.center
        view.image = #imageLiteral(resourceName: "shopify_icon").withRenderingMode(.alwaysOriginal)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavTitleView()
        createPulseLayer()
        setupLabels()
        NotificationCenter.default.addObserver(self, selector: #selector(handleForeground), name: .UIApplicationWillEnterForeground, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animatePulse()
        scalePulseAnimation()
    }
    
    private func createPulseLayer() {
        let radius: CGFloat = 50
        let xPosition = view.center.x + 75
        let yPosition = view.center.y - 40
        let pulsePosition = CGPoint(x: xPosition, y: yPosition)
        
        self.pulseShapeLayer = createShapeLayer(withRadius: radius, position: pulsePosition, fillColor: UIColor.themeIndigo(), strokeEnd: 0, strokeColor: UIColor.white, lineWidth: 0)
        view.layer.addSublayer(pulseShapeLayer)
        
        let shapeTrackLayer = createShapeLayer(withRadius: radius, position: pulsePosition, fillColor: .clear, strokeEnd: 1, strokeColor: UIColor.themeIndigoDark(), lineWidth: 15)
        view.layer.addSublayer(shapeTrackLayer)
        
        self.shapeLayer = createShapeLayer(withRadius: radius, position: pulsePosition, fillColor: .clear, strokeEnd: 0, strokeColor: .themeLightIndigo(), lineWidth: 15)
        view.layer.addSublayer(shapeLayer)
        
        view.addSubview(shopifyIconView)
        shopifyIconView.center = pulsePosition
    }
    
    private func animatePulse() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 1
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        //shapeLayer.add(animation, forKey: "customLoading")
        
        let keyAnimation = CAKeyframeAnimation(keyPath: "strokeEnd")
        keyAnimation.values =  [0.1, 0.2, 0.3, 0.4, 0.5, 1]
        keyAnimation.duration = 3
        keyAnimation.repeatCount = Float.infinity
        keyAnimation.fillMode = kCAFillModeForwards
        keyAnimation.isRemovedOnCompletion = false
        shapeLayer.add(keyAnimation, forKey: "customLoading")
    }
    
    private func scalePulseAnimation() {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.toValue = 1.8
        animation.duration = 0.8
        animation.repeatCount = Float.infinity
        animation.autoreverses = true
        animation.timingFunction = CAMediaTimingFunction(name:         kCAMediaTimingFunctionEaseInEaseOut)
        pulseShapeLayer.add(animation, forKey: "scalePulse")
        
        let imageAnimation = CABasicAnimation(keyPath: "transform.scale")
        imageAnimation.toValue = 1.2
        imageAnimation.duration = 0.8
        imageAnimation.repeatCount = Float.infinity
        imageAnimation.autoreverses = true
        imageAnimation.timingFunction = CAMediaTimingFunction(name:         kCAMediaTimingFunctionEaseInEaseOut)
        shopifyIconView.layer.add(animation, forKey: "scalePulse")
    }
    
    private func setupNavTitleView() {
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "shopify_logo_white"))
        titleImageView.contentMode = .scaleAspectFill
        navigationItem.titleView = titleImageView
    }
    
    private func setupLabels() {
        statsLabel.attributedText = createAttributedText(withTitle: "500,000", description: "BUSINESSES POWERED BY SHOPIFY", titleFontSize: 30, descriptionFontSize: 16, titleColor: .themeIndigo(), descriptionColor: .darkGray)
        soldLabel.attributedText = createAttributedText(withTitle: "$46B+", description: "SOLD ON SHOPIFY", titleFontSize: 30, descriptionFontSize: 16, titleColor: .themeIndigo(), descriptionColor: .darkGray)
    }
    
    private func createAttributedText(withTitle title: String, description: String, titleFontSize: CGFloat, descriptionFontSize: CGFloat, titleColor: UIColor, descriptionColor: UIColor) -> NSAttributedString {
        
        let attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedStringKey.font:  UIFont.systemFont(ofSize: titleFontSize, weight: UIFont.Weight.heavy), NSAttributedStringKey.foregroundColor: titleColor])
        attributedText.append(NSAttributedString(string: "\n\n", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 4)]))
        attributedText.append(NSAttributedString(string: description, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: descriptionFontSize), NSAttributedStringKey.foregroundColor: descriptionColor]))
        return attributedText
    }
    
    @objc private func handleForeground() {
        scalePulseAnimation()
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
}











