//
//  Helpers.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-20.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit


public class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    func setup() {}
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public enum StoryBoardSegueIdentifiers: String {
    case ordersSegueId = "FromOrdersVC"
    case storeSegueId = "FromStoreVC"
    case loginSegueId = "SegueToLoginVC"
    case signupSegueId = "SegueToSignupVC"
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

protocol Cachable {}

extension UIImageView: Cachable {}

let imageCache = NSCache<NSString, UIImage>()

extension Cachable where Self: UIImageView {
    typealias completionHandler = ((Bool) -> ())
    
    func loadImageCach(with urlString: String, completion: @escaping completionHandler) {
        self.image = nil
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            DispatchQueue.main.async {
                self.image = cachedImage
                completion(true)
            }
            return
        }
        if let url = URL.init(string: urlString) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, _, error) in
                if error != nil {
                    print(error!.localizedDescription)
                    completion(false)
                    return
                }
                if let data = data {
                    if let image = UIImage(data: data) {
                        imageCache.setObject(image, forKey: NSString.init(string: urlString))
                        DispatchQueue.main.async {
                            self.image = image
                            completion(true)
                        }
                    }
                }
            }).resume()
        }
    }
}

















