//
//  UIView+Extension.swift
//  NikeshTutorial
//
//  Created by Nikesh Shakya on 19/12/2022.
//

import UIKit

extension UIView {
    
    func setViewVisibility(hidden: Bool, duration: TimeInterval, completion: ((Bool) -> Void)?) {
        UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve, animations: { [weak self] in
            self?.isHidden = hidden
            }, completion: completion)
    }
    
    func setRadius(radius: CGFloat? = nil) {
        self.layer.cornerRadius = radius ?? self.frame.width / 2;
        self.layer.masksToBounds = true;
    }
    
    func setRounded() {
        let radius = self.frame.width / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
