//
//  SPSpringExpandAnimator.m
//  SPAnimatedTransitions
//
//  Created by Swechha Prakash on 03/05/14.
//  Copyright (c) 2014 Swechha. All rights reserved.
//

#import "SPSpringExpandAnimator.h"
#import <Pop/POP.h>

@implementation SPSpringExpandAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [[transitionContext containerView] addSubview:toViewController.view];
    
    POPSpringAnimation *expandAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
    CGRect toRect = toViewController.view.bounds;
    CGRect fromRect = CGRectMake(fromViewController.view.frame.size.width/2-5, fromViewController.view.frame.size.height/2-5, 10, 10);
    expandAnimation.fromValue = [NSValue valueWithCGRect:fromRect];
    expandAnimation.toValue = [NSValue valueWithCGRect:toRect];
    expandAnimation.springSpeed = 4.0;
    expandAnimation.springBounciness = 20.0;
    expandAnimation.dynamicsTension = 50.0;
    expandAnimation.dynamicsFriction = 5.0;
    
    [toViewController.view.layer pop_addAnimation:expandAnimation forKey:@"expandAnimation"];
    
    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
}

@end
