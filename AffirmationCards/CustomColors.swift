//
//  CustomColors.swift
//  AffirmationCards
//
//  Created by Missy Allan on 1/25/17.
//  Copyright © 2017 Missy Allan. All rights reserved.
//

import Foundation
import UIKit

 //MARK: Theme Colors
extension UIColor {
        
        public static let themeSunshine = UIColor(red:1.00, green:0.88, blue:0.33, alpha:1.0)
        public static let themeCreamsicle = UIColor(red:1.00, green:0.74, blue:0.41, alpha:1.0)
        public static let themeCoral = UIColor(red:0.95, green:0.56, blue:0.52, alpha:1.0)
        public static let themePink =  UIColor(red:0.77, green:0.43, blue:0.62, alpha:1.0)
        public static let themePurple = UIColor(red:0.60, green:0.40, blue:0.64, alpha:1.0)
    }


// MARK: Gradients
extension CAGradientLayer {
    convenience init(_ colors: [UIColor]) {
        self.init()
        
        self.colors = colors.map { $0.cgColor }
    }
}

extension CALayer {
    public static func makeGradient(firstColor: UIColor, secondColor: UIColor) -> CAGradientLayer {
        let backgroundGradient = CAGradientLayer()
        
        backgroundGradient.colors = [firstColor.cgColor, secondColor.cgColor]
        backgroundGradient.locations = [0, 1]
        backgroundGradient.startPoint = CGPoint(x: 0, y: 0)
        backgroundGradient.endPoint = CGPoint(x: 0, y: 1)
        
        return backgroundGradient
    }
}
