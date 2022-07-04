//
//  UIView+Ex.swift
//  Adv
//
//  Created by Dmitry Lapata on 3.07.22.
//

import UIKit

extension UIView {
    func setGradientBackground(_ colors: [UIColor], locations: [NSNumber] = [0.0, 1.0], startPoint: CGPoint = CGPoint(x: 0, y: 1), endPoint: CGPoint = CGPoint(x: 1, y: 0)) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.locations = locations
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
