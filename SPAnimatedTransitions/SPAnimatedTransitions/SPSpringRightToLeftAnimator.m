//
//  SPSpringRightToLeftAnimator.m
//  SPAnimatedTransitions
//
//  Created by Swechha Prakash on 03/05/14.
//  Copyright (c) 2014 Swechha. All rights reserved.
//

#import "SPSpringRightToLeftAnimator.h"
#import <pop/POP.h>

@implementation SPSpringRightToLeftAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [[transitionContext containerView] addSubview:toViewController.view];
    [[transitionContext containerView] addSubview:fromViewController.view];
    
    POPSpringAnimation *rightToLeftAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    rightToLeftAnimation.fromValue = @(3*([[UIScreen mainScreen] bounds].size.width/2));
    rightToLeftAnimation.toValue = @([[UIScreen mainScreen] bounds].size.width/2);
    rightToLeftAnimation.dynamicsFriction = 5.0;
    rightToLeftAnimation.springBounciness = 10.0;
    rightToLeftAnimation.springSpeed = 2.0;
    
    POPSpringAnimation *prevViewRightToLeftAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    prevViewRightToLeftAnimation.fromValue = @([[UIScreen mainScreen] bounds].size.width/2);
    prevViewRightToLeftAnimation.toValue = @(-[[UIScreen mainScreen] bounds].size.width/2);
    prevViewRightToLeftAnimation.dynamicsFriction = 5.0;
    prevViewRightToLeftAnimation.springBounciness = 10.0;
    prevViewRightToLeftAnimation.springSpeed = 2.0;
    
    [toViewController.view.layer pop_addAnimation:rightToLeftAnimation forKey:@"rightToLeftAnimation"];
    [fromViewController.view.layer pop_addAnimation:prevViewRightToLeftAnimation forKey:@"prevViewRightToLeftAnimation"];
    
    rightToLeftAnimation.completionBlock = ^(POPAnimation *a, BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    };
}


@end
