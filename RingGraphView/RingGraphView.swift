//
//  RingGraphView.swift
//  RingGraphView
//
//  Created by Marvin Gatermann on 18.11.22.
//

import UIKit

class RingGraphView: UIView {
    
    let ringLayer: CAShapeLayer = CAShapeLayer()
    let backdropLayer: CAShapeLayer = CAShapeLayer()
    let ringWidth: CGFloat = CGFloat(20.0)
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        let circlePath: CGPath = UIBezierPath(ovalIn: CGRect(x: ringWidth/2, y: ringWidth/2, width: bounds.width - ringWidth, height: bounds.height - ringWidth)).cgPath
        let offSet = CGFloat(90 * Double.pi / 180)
        
        backdropLayer.path = circlePath
        backdropLayer.lineWidth = ringWidth
        backdropLayer.strokeEnd = 1.0
        backdropLayer.fillColor = UIColor.white.cgColor
        backdropLayer.strokeColor = UIColor(red: 0.106, green: 0.212, blue: 0.337, alpha: 1).cgColor
        layer.addSublayer(backdropLayer)
        
        ringLayer.path = circlePath
        ringLayer.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
        ringLayer.lineWidth = ringWidth
        ringLayer.strokeColor = UIColor.white.cgColor
        //ringLayer.fillColor = nil
        ringLayer.strokeEnd = 0.5
        ringLayer.lineCap = .round
        ringLayer.transform = CATransform3DMakeRotation(offSet, 0, 0, -1)
        layer.addSublayer(ringLayer)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 1, green: 0.667, blue: 0.443, alpha: 1).cgColor,
            UIColor(red: 1, green: 0.431, blue: 0.302, alpha: 1).cgColor
        ]
        gradientLayer.frame = bounds
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.mask = ringLayer
        layer.addSublayer(gradientLayer)
        
        
        
    }

}
