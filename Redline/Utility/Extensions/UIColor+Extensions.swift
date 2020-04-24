//
//  UIColor+Extensions.swift
//  Redline
//
//  Created by AnnaThomas on 24/04/20.
//  Copyright © 2020 QBurst Technologies. All rights reserved.
//

import UIKit

extension UIColor {
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
