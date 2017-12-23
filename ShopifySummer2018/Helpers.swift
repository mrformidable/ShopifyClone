//
//  Helpers.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-20.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit


class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    func setup() {}

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

enum StoryBoardSegueIdentifiers: String {
    case ordersSegueId = "FromOrdersVC"
    case storeSegueId = "FromStoreVC"
}

/*
 Create parallaxMotionEffect
*/
public func createParallaxMotionEffect(view: UIView, magnitude: Float) {
    let xMotion = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
    xMotion.maximumRelativeValue = magnitude
    xMotion.minimumRelativeValue = -magnitude
    
    let yMotion = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
    yMotion.maximumRelativeValue = magnitude
    yMotion.minimumRelativeValue = -magnitude
    
    let group = UIMotionEffectGroup()
    group.motionEffects = [xMotion, yMotion]
    view.addMotionEffect(group)
}
/*
 Create shakeAnimation for textField
 */
extension UITextField {
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = CGPoint(x: self.center.x - 4, y: self.center.y)
        animation.toValue = CGPoint(x: self.center.x + 4, y: self.center.y)
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        self.layer.add(animation, forKey: "position")
    }
}

