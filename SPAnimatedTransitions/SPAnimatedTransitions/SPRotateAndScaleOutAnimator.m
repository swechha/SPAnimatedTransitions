//
//  SPRotateAndScaleOutAnimator.m
//  SPAnimatedTransitions
//
//  Created by Swechha Prakash on 17/04/14.
//  Copyright (c) 2014 Swechha. All rights reserved.
//

#import "SPRotateAndScaleOutAnimator.h"

@implementation SPRotateAndScaleOutAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [[transitionContext containerView] addSubview:toViewController.view];
    toViewController.view.alpha = 0;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        CGAffineTransform scaleOut = CGAffineTransformMakeScale(0.1, 0.1);
        CGAffineTransform rotate = CGAffineTransformMakeRotation(M_PI);
        fromViewController.view.transform = CGAffineTransformConcat(scaleOut, rotate);
        toViewController.view.alpha = 1;
    }completion:^(BOOL finished) {
        fromViewController.view.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
