//
//  TransitionController.swift
//  PlayButtonAnimation
//
//  Created by Amir Rezvani on 4/9/15.
//  Copyright (c) 2015 cjcoaxapps. All rights reserved.
//

import UIKit

class TransitionController : NSObject, UIViewControllerAnimatedTransitioning,UIViewControllerTransitioningDelegate {
    let duration : NSTimeInterval = 2
    var animating = false


    weak var storedContext: UIViewControllerContextTransitioning? = nil
    

    
    //MARK: - UIViewControllerAnimatedTransitioning delegate
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }
    
    
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        storedContext = transitionContext

        
        //1.obtain state from context
        let secondVc = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as!  ToViewController
        
        let firstVc = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! FromViewController
        
        let finalFrame = transitionContext.finalFrameForViewController(secondVc)
        
        //2.obtain the container
        let containerView = transitionContext.containerView()
        containerView.addSubview(secondVc.view)
        //grow logo
        let animation = CABasicAnimation(keyPath: "transform")
        animation.toValue = NSValue(CATransform3D:
            CATransform3DMakeScale(75.0, 75.0, 1.0)
        )
        animation.duration = duration
        animation.delegate = self
        firstVc.logo?.addAnimation(animation, forKey: "toTransform")
        
        secondVc.maskLayer?.opacity = 0.0
        let fadeIn = CABasicAnimation()
        fadeIn.keyPath = "opacity"
        fadeIn.duration = duration
        fadeIn.toValue = 3.0
        secondVc.maskLayer?.addAnimation(fadeIn, forKey: nil)
        secondVc.maskLayer?.addAnimation(animation, forKey: nil)

        
    }


    
    
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {

        if let context = storedContext {
            let secondVc = context.viewControllerForKey(UITransitionContextToViewControllerKey) as!  ToViewController
            context.completeTransition(!context.transitionWasCancelled())
            secondVc.view.backgroundColor = UIColor(red: 203.0/255.0, green: 243.0/255.0, blue: 4.0/255.0, alpha: 1.0)
            
        }
        storedContext = nil
        animating = false

    }
    
}











