//
//  SPNavigationController.m
//  SPAnimatedTransitions
//
//  Created by Swechha Prakash on 16/04/14.
//  Copyright (c) 2014 Swechha. All rights reserved.
//

#import "SPNavigationController.h"
#import "SPScaleOutAnimator.h"

@interface SPNavigationController ()
@property id<UIViewControllerAnimatedTransitioning> animator;
@end

@implementation SPNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)pushViewController:(UIViewController *)viewController usingAnimation:(SPTransitionAnimationStyle)animationStyle
{
    self.animator = [self animatorForAnimationStyle:animationStyle];
    [self pushViewController:viewController animated:YES];
}

- (void)popViewControllerUsingAnimation:(SPTransitionAnimationStyle)animationStyle
{
    self.animator = [self animatorForAnimationStyle:animationStyle];
    [self popViewControllerAnimated:YES];
}

/*
 * Return animator object based on SPTransitionAnimationStyle
 */
- (id<UIViewControllerAnimatedTransitioning>)animatorForAnimationStyle:(SPTransitionAnimationStyle)animationStyle
{
    switch (animationStyle) {
        case SPTransitionAnimationStyleDefault:
            return nil;
            break;
        
        case SPTransitionAnimationStyleScaleOut:
            return [[SPScaleOutAnimator alloc] init];
        
        default:
            return nil;
            break;
    }
}

#pragma mark - UINavigationControllerDelegate methods

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    return self.animator;
}

@end