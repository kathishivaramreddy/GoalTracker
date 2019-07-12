//
//  UIViewExtension.swift
//  GoalTracker
//
//  Created by apple on 7/12/19.
//  Copyright © 2019 shivaapple. All rights reserved.
//

import UIKit

extension UIView {
    
    func bindToKeyBoard() {
        
        NotificationCenter.default.addObserver(self , selector: #selector(keyBoardWillChange), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
    }
    
    @objc func keyBoardWillChange(_ notification: NSNotification) {
        
        let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        let startingFrame = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endingFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let deltaY = endingFrame.origin.y - startingFrame.origin.y
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIView.KeyframeAnimationOptions.init(rawValue: curve), animations: {
            self.frame.origin.y += deltaY
        }, completion: nil)
        
    }
    
}
