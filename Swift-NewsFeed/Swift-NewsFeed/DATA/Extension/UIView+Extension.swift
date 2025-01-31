//
//  UIView+Extension.swift
//  Swift-NewsFeed
//
//  Created by Berk Canpolat on 31.01.2025.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get{return self.layer.cornerRadius}
        set{self.layer.cornerRadius = newValue}
    }
}
