//
//  SPSpringLeftToRightAnimator.m
//  SPAnimatedTransitions
//
//  Created by Swechha Prakash on 03/05/14.
//  Copyright (c) 2014 Swechha. All rights reserved.
//

#import "SPSpringLeftToRightAnimator.h"
#import <pop/POP.h>

@implementation SPSpringLeftToRightAnimator

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
    
    POPSpringAnimation *leftToRightAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    leftToRightAnimation.fromValue = @(-([[UIScreen mainScreen] bounds].size.width/2));
    leftToRightAnimation.toValue = @([[UIScreen mainScreen] bounds].size.width/2);
    leftToRightAnimation.dynamicsFriction = 5.0;
    leftToRightAnimation.springBounciness = 10.0;
    leftToRightAnimation.springSpeed = 2.0;
    
    [toViewController.view.layer pop_addAnimation:leftToRightAnimation forKey:@"leftToRightAnimation"];
    
    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
}


@end
