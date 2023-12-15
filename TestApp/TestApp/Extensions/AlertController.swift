//
//  AlertController.swift
//  TestApp
//
//  Created by Елена Воронцова on 15.12.2023.
//

import UIKit

extension UIAlertController {
    
    func pruneNegativeWidthConstraints() {
        
        for subView in self.view.subviews {
            for constraint in subView.constraints where constraint.debugDescription.contains("width == - 16") {
                subView.removeConstraint(constraint)
            }
        }
    }
}
