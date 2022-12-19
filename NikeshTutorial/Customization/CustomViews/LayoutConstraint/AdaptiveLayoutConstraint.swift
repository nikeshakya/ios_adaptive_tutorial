//
//  AdaptiveLayoutConstraint.swift
//  NikeshTutorial
//
//  Created by Nikesh Shakya on 19/12/2022.
//

import Foundation
import UIKit

class AdaptiveLayoutConstraint: NSLayoutConstraint {
    
    @IBInspectable var setAdaptiveLayout: Bool = false {
        didSet {
        }
    }
    
    override func awakeFromNib() {
        if setAdaptiveLayout {
            self.constant = self.constant.relativeToIphone8Width()
            
            if let firstView = self.firstItem as? UIView {
                firstView.layoutIfNeeded()
            }
            if let secondVIew = self.secondItem as? UIView {
                secondVIew.layoutIfNeeded()
            }
        }
    }
    
}
