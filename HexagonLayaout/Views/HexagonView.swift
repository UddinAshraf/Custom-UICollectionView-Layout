//
//  HexagonView.swift
//  HexagonLayout
//
//  Created by BS126 on 12/3/18.
//  Copyright © 2018 BS23. All rights reserved.
//

import Foundation
import UIKit

class HexagonView: UIControl {
    
    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.gray
        hexagonLayer()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func hexagonLayer() {
        self.createHexagon()
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = self.path.cgPath
        self.layer.mask = shapeLayer
    }
    
    func createHexagon() {
        path = UIBezierPath()
        path.move(to: CGPoint(x: self.bounds.origin.x + 75, y: 0))
        path.addLine(to: CGPoint(x: self.bounds.origin.x, y: 40))
        path.addLine(to: CGPoint(x: self.bounds.origin.x, y: 120))
        path.addLine(to: CGPoint(x: self.bounds.origin.x + 75 , y: 160))
        path.addLine(to: CGPoint(x: self.bounds.origin.x + 75 + 75 , y: 120))
        path.addLine(to: CGPoint(x: self.bounds.origin.x + 75 + 75 , y: 40))
        path.close()
    }
}
