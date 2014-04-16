//
//  SPNavigationController.h
//  SPAnimatedTransitions
//
//  Created by Swechha Prakash on 16/04/14.
//  Copyright (c) 2014 Swechha. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SPTransitionAnimationStyle) {
    SPTransitionAnimationStyleDefault,
    SPTransitionAnimationStyleScaleOut,
};

@interface SPNavigationController : UINavigationController <UINavigationControllerDelegate>

- (void)pushViewController:(UIViewController *)viewController usingAnimation:(SPTransitionAnimationStyle)animationStyle;
- (void)popViewControllerUsingAnimation:(SPTransitionAnimationStyle)animationStyle;

@end
