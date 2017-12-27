//
//  Helpers.swift
//  ShopifySummer2018
//
//  Created by Michael A on 2017-12-20.
//  Copyright © 2017 Shopify Inc. All rights reserved.
//

import UIKit
import AudioToolbox

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

/*
 Create vibration sound for textField
 */
public func playVibrationSound() {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
}

/*
 Create image cache for images
 */
public protocol Cachable {}

extension UIImageView: Cachable {}

public let imageCache = NSCache<NSString, UIImage>()

extension Cachable where Self: UIImageView {
    typealias completionHandler = ((Bool) -> ())
    
    func loadImageCach(with urlString: String, completion: completionHandler?) {
        self.image = nil
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            DispatchQueue.main.async {
                self.image = cachedImage
                completion?(true)
            }
            return
        }
        if let url = URL.init(string: urlString) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, _, error) in
                if error != nil {
                    print(error!.localizedDescription)
                    completion?(false)
                    return
                }
                if let data = data {
                    if let image = UIImage(data: data) {
                        imageCache.setObject(image, forKey: NSString.init(string: urlString))
                        DispatchQueue.main.async {
                            self.image = image
                            completion?(true)
                        }
                    }
                }
            }).resume()
        }
    }
}


/*
 Create shapeAnimation
 */
public func createShapeLayer(withRadius radius: CGFloat, position: CGPoint, fillColor: UIColor, strokeEnd: CGFloat, strokeColor: UIColor, lineWidth: CGFloat) -> CAShapeLayer {
    let shapeLayer = CAShapeLayer()
    let circularPath = UIBezierPath(arcCenter: .zero, radius: radius, startAngle: 0, endAngle: .pi * 2, clockwise: true).cgPath
    shapeLayer.position = position
    shapeLayer.path = circularPath
    shapeLayer.strokeEnd = strokeEnd
    shapeLayer.lineCap = kCALineCapRound
    shapeLayer.lineWidth = lineWidth
    shapeLayer.strokeColor = strokeColor.cgColor
    shapeLayer.fillColor = fillColor.cgColor
    shapeLayer.transform = CATransform3DMakeRotation(-.pi / 2, 0, 0, 1)
    return shapeLayer
}

