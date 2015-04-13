//
//  Logo.swift
//  PlayButtonAnimation
//
//  Created by Amir Rezvani on 4/9/15.
//  Copyright (c) 2015 cjcoaxapps. All rights reserved.
//

import UIKit
import QuartzCore

class LogoLayer {

    class func logoLayer(boundingBox:CGSize) -> CAShapeLayer {
        
        let layer = CAShapeLayer()
        layer.geometryFlipped = true
        
        let bezierPath = UIBezierPath(arcCenter: CGPoint(x: boundingBox.width/2.0, y: boundingBox.height/2.0),
            radius: min(boundingBox.width, boundingBox.height),
            startAngle: 0.0,
            endAngle: CGFloat(M_PI) * 2,
            clockwise: true)
        
        layer.path = bezierPath.CGPath
        layer.bounds = CGPathGetBoundingBox(layer.path)
        
        return layer
    }
}
