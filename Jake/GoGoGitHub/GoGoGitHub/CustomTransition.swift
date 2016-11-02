//
//  CustomTransition.swift
//  GoGoGitHub
//
//  Created by Jacob Dobson on 11/2/16.
//  Copyright © 2016 Jacob Dobson. All rights reserved.
//

import UIKit

class CustomTransition: NSObject {

    var duration: TimeInterval
    
    init(duration: TimeInterval = 1.0) {
        self.duration = duration
    }
}


extension CustomTransition: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        //transitionContext has ref to "to" and "from" VC's
        guard let toVC = transitionContext.viewController(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(toVC.view)
        
        toVC.view.alpha = 0.0
        
        UIView.animate(withDuration: duration, animations: {
            toVC.view.alpha = 1.0
        }, completion: { (finished) in
            transitionContext.completeTransition(true)
        })
    }
}
