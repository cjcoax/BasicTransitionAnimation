//
//  ViewController.swift
//  PlayButtonAnimation
//
//  Created by Amir Rezvani on 4/9/15.
//  Copyright (c) 2015 cjcoaxapps. All rights reserved.
//

import UIKit

class FromViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var logoView: UIView!
//    @IBOutlet weak var footballView: UIView!
//    @IBOutlet weak var grayView: UIView!
    
    let transition = TransitionController()
    let tapRecognizer = UITapGestureRecognizer()
    
    
    var logo : CAShapeLayer?
    var bigCircle : CAShapeLayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapRecognizer.addTarget(self, action: "circleTapped:")

        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        

//        footballView.addGestureRecognizer(tapRecognizer)
        
        logo = LogoLayer.logoLayer(logoView.frame.size)
        
        
        
        logoView.layer.addSublayer(logo)
        
        logo!.position = CGPoint(x: CGRectGetMidX(logoView.bounds), y: CGRectGetMidY(logoView.bounds))

        logo!.fillColor = UIColor(red: 203.0/255.0, green: 243.0/255.0, blue: 4.0/255.0, alpha: 1.0).CGColor
        logoView.backgroundColor = UIColor.clearColor()

        
//        bigCircle = LogoLayer.logoLayer(grayView.frame.size)
//        grayView.layer.addSublayer(bigCircle)
//        bigCircle!.position = CGPoint(x: CGRectGetMidX(grayView.bounds), y: CGRectGetMidY(grayView.bounds))
//        bigCircle!.fillColor = UIColor(red: 172.0/255.0, green: 172.0/255.0, blue: 172.0/255.0, alpha: 0.4).CGColor
        
        

        
        (UIApplication.sharedApplication().delegate as! AppDelegate).logoView = logoView
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        logoView.addGestureRecognizer(tapRecognizer)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier?.lowercaseString == "dribblesegue" {
            let toVc: UIViewController = segue.destinationViewController 
            toVc.transitioningDelegate = self
        }
    }
    
    
    func circleTapped(recognizer:UITapGestureRecognizer) {
        performSegueWithIdentifier("dribbleSegue", sender: self)
    }
    
    
    //MARK: - UIViewControllerTransitioningDelegate
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return transition
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

    
    @IBAction func unwindToViewController (sender: UIStoryboardSegue){
        
    }

}










