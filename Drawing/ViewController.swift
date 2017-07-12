//
//  ViewController.swift
//  Drawing
//
//  Created by Calvin Gonçalves de Aquino on 7/8/17.
//  Copyright © 2017 Calvin. All rights reserved.
//

import UIKit

class DrawableView : UIView {
    var drawings: [Drawing] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGestures()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupGestures()
    }
    
    func setupGestures() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(didTouch(_:)))
        self.addGestureRecognizer(pan)
    }
    
    @objc func didTouch(_ gesture: UIGestureRecognizer) {
        let touch = gesture.location(in: self)
        switch gesture.state {
        case .began:
            let drawing: Drawing = Drawing()
            drawing.points.append(touch)
            drawings.append(drawing)
        case .changed:
            let drawing = drawings.last
            drawing?.points.append(touch)
        case .ended:
            let drawing = drawings.last
            drawing?.points.append(touch)
        default:
            break
        }
        
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        
        for drawing in drawings {
            if let first = drawing.points.first {
                path.move(to: first)
                for i in 1..<drawing.points.count {
                    let point = drawing.points[i]
                    path.addLine(to: point)
                }
            }
        }
        UIColor.black.setStroke()
        path.lineWidth = 10
        path.lineCapStyle = .round
        path.stroke()
    }
}

class Drawing {
    var points: [CGPoint] = []
}


class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Drawing"
        
        let drawableView: DrawableView = DrawableView(frame: self.view.bounds)
        drawableView.backgroundColor = .gray
        self.view.addSubview(drawableView)
        _ = drawableView.superAnchor(self.view)
    }
}


