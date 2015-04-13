//
//  File.swift
//  PlayButtonAnimation
//
//  Created by Amir Rezvani on 4/9/15.
//  Copyright (c) 2015 cjcoaxapps. All rights reserved.
//

import UIKit

class ToViewController : UIViewController {
    var maskLayer : CAShapeLayer?
    
//    @IBOutlet weak var pin: CircleView!
    @IBOutlet weak var pinBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var pinView: UIView!
    @IBOutlet weak var calendarBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var calendarView: UIView!
    @IBOutlet weak var calendarHorizontalConstraint: NSLayoutConstraint!
    @IBOutlet weak var numberViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var numberViewHorizontalConstraint: NSLayoutConstraint!
    @IBOutlet weak var numberView: UIView!
    @IBOutlet weak var closeView: UIView!
    @IBOutlet weak var closeViewVerticalConstraint: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let logoView = (UIApplication.sharedApplication().delegate as! AppDelegate).logoView
        
        maskLayer = LogoLayer.logoLayer(logoView!.bounds.size)
        maskLayer?.position = logoView!.center
        maskLayer?.backgroundColor = UIColor(red: 203.0/255.0, green: 243.0/255.0, blue: 4.0/255.0, alpha: 1.0).CGColor
        
        view.layer.mask = maskLayer
        

        addCircleLayer(pinView.layer, bounds: pinView.bounds)
        addCircleLayer(calendarView.layer, bounds: calendarView.bounds)
        addCircleLayer(numberView.layer, bounds: numberView.bounds)
        addCircleLayer(closeView.layer, bounds: closeView.bounds, backgroundColor: UIColor.blackColor())
        

        
    }
    
    
    
    
    func addCircleLayer(toLayer:CALayer,bounds:CGRect,backgroundColor:UIColor = UIColor.whiteColor()) {
        let circleLayer = CAShapeLayer()
        
        let path = UIBezierPath(arcCenter:
            CGPoint(x: CGRectGetMidX(bounds), y: CGRectGetMidY(bounds)),
            radius: min(CGRectGetMidX(bounds), CGRectGetMidY(bounds)),
            startAngle: 0,
            endAngle: CGFloat(M_PI) * 2,
            clockwise: true)
        
        circleLayer.path = path.CGPath
        circleLayer.fillColor = backgroundColor.CGColor
        toLayer.insertSublayer(circleLayer, atIndex: 0)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.layoutIfNeeded()
        pinBottomConstraint.constant = 150
        calendarBottomConstraint.constant = 100
        calendarHorizontalConstraint.constant = -100
        numberViewBottomConstraint.constant = 100
        numberViewHorizontalConstraint.constant = 100
        closeViewVerticalConstraint.constant = 70
        
        UIView.animateWithDuration(0.7,
            delay: 0.1,
            usingSpringWithDamping: 0.4,
            initialSpringVelocity: 1,
            options: .LayoutSubviews,
            animations: { () -> Void in
                self.view.layoutIfNeeded()
            },
            completion: { completed in
                
        })

    }
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }

    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        view.layer.mask = nil
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

    }
}


















