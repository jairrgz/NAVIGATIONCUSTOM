//
//  SlideInAnimator.swift
//  NAVEGATION CUSTOM
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 7/01/25.
//

import UIKit

class SlideInAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toView = transitionContext.view(forKey: .to),
              let fromView = transitionContext.view(forKey: .from) else { return }
        
        let containerView = transitionContext.containerView
        let isPresenting = transitionContext.view(forKey: .to) != nil
        
        if isPresenting {
            containerView.addSubview(toView)
            toView.transform = CGAffineTransform(translationX: containerView.frame.width, y: 0)
        }
        
        let finalTransform = isPresenting ?
            CGAffineTransform.identity :
            CGAffineTransform(translationX: containerView.frame.width, y: 0)
        
        UIView.animate(
            withDuration: transitionDuration(using: transitionContext),
            delay: 0,
            options: .curveEaseInOut,
            animations: {
                if isPresenting {
                    toView.transform = finalTransform
                } else {
                    fromView.transform = finalTransform
                }
            },
            completion: { _ in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        )
    }
}
