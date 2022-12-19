//
//  UIStackView+Extension.swift
//  NikeshTutorial
//
//  Created by Nikesh Shakya on 19/12/2022.
//

import UIKit

extension UIStackView {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        if self.axis == .horizontal {
            self.spacing = self.spacing.relativeToIphone8Width()
        } else {
            self.spacing = self.spacing.relativeToIphone8Height()
        }
        self.layoutIfNeeded()
    }
    
}
