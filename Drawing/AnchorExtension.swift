//
//  File.swift
//  Drawing
//
//  Created by Calvin Gonçalves de Aquino on 7/8/17.
//  Copyright © 2017 Calvin. All rights reserved.
//

import UIKit

//Convenience
extension UIView {
    //single anchor convenience
    func topAnchor(_ anchor:NSLayoutAnchor<NSLayoutYAxisAnchor>) -> NSLayoutConstraint {
        return topAnchor(anchor, constant: 0)
    }
    
    func topAnchor(_ anchor:NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = self.topAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.isActive = true
        return constraint
    }
    
    func bottomAnchor(_ anchor:NSLayoutAnchor<NSLayoutYAxisAnchor>) -> NSLayoutConstraint {
        return bottomAnchor(anchor, constant: 0)
    }
    
    func bottomAnchor(_ anchor:NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = self.bottomAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.isActive = true
        return constraint
    }
    
    func leftAnchor(_ anchor:NSLayoutAnchor<NSLayoutXAxisAnchor>) -> NSLayoutConstraint {
        return leftAnchor(anchor, constant: 0)
    }
    
    func leftAnchor(_ anchor:NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = self.leadingAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.isActive = true
        return constraint
    }
    
    func rightAnchor(_ anchor:NSLayoutAnchor<NSLayoutXAxisAnchor>) -> NSLayoutConstraint {
        return rightAnchor(anchor, constant: 0)
    }
    
    func rightAnchor(_ anchor:NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = self.trailingAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.isActive = true
        return constraint
    }
    
    //multiple anchor convenience
    func horizontalAnchors(_ view: UIView) -> (leftConstraint: NSLayoutConstraint, rightConstraint: NSLayoutConstraint) {
        return horizontalAnchors(view, leftConstant: 0, rightConstant: 0)
    }
    
    func horizontalAnchors(_ view: UIView, leftConstant: CGFloat, rightConstant: CGFloat) -> (leftConstraint: NSLayoutConstraint, rightConstraint: NSLayoutConstraint) {
        let leftConstraint = self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leftConstant)
        let rightConstraint = self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: rightConstant)
        leftConstraint.isActive = true
        rightConstraint.isActive = true
        return (leftConstraint, rightConstraint)
    }
    
    func verticalAnchors(_ view: UIView) -> (topConstraint: NSLayoutConstraint, bottomConstraint: NSLayoutConstraint) {
        return verticalAnchors(view, topConstant: 0, bottomConstant: 0)
    }
    
    func verticalAnchors(_ view: UIView, topConstant: CGFloat, bottomConstant: CGFloat) -> (topConstraint: NSLayoutConstraint, bottomConstraint: NSLayoutConstraint) {
        let topConstraint = self.topAnchor.constraint(equalTo: view.topAnchor, constant: topConstant)
        let bottomConstraint = self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottomConstant)
        topConstraint.isActive = true
        bottomConstraint.isActive = true
        return (topConstraint, bottomConstraint)
    }
    
    func superAnchor(_ view: UIView) -> (topConstraint: NSLayoutConstraint, bottomConstraint: NSLayoutConstraint, leftConstraint: NSLayoutConstraint, rightConstraint: NSLayoutConstraint) {
        let (topConstraint, bottomConstraint) = verticalAnchors(view, topConstant: 0, bottomConstant: 0)
        let (leftConstraint, rightConstraint) = horizontalAnchors(view, leftConstant: 0, rightConstant: 0)
        return (topConstraint, bottomConstraint, leftConstraint, rightConstraint)
    }
    
    func superAnchor(_ view: UIView, topConstant: CGFloat, bottomConstant: CGFloat, leftConstant: CGFloat, rightConstant: CGFloat) -> (topConstraint: NSLayoutConstraint, bottomConstraint: NSLayoutConstraint, leftConstraint: NSLayoutConstraint, rightConstraint: NSLayoutConstraint) {
        let (topConstraint, bottomConstraint) = verticalAnchors(view, topConstant: topConstant, bottomConstant: bottomConstant)
        let (leftConstraint, rightConstraint) = horizontalAnchors(view, leftConstant: leftConstant, rightConstant: rightConstant)
        return (topConstraint, bottomConstraint, leftConstraint, rightConstraint)
    }
}

