//
//  SPNavigationController.m
//  SPAnimatedTransitions
//
//  Created by Swechha Prakash on 16/04/14.
//  Copyright (c) 2014 Swechha. All rights reserved.
//

#import "SPNavigationController.h"
#import "SPScaleOutAnimator.h"
#import "SPRotateAndScaleOutAnimator.h"

@interface SPNavigationController ()
@property id<UIViewControllerAnimatedTransitioning> animator;
@property UIPercentDrivenInteractiveTransition *interactionController;
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
    
    //Set up interaction controller
    UIScreenEdgePanGestureRecognizer *recognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [recognizer setEdges:UIRectEdgeLeft];
    [self.view addGestureRecognizer:recognizer];
}

- (void)handlePan:(UIScreenEdgePanGestureRecognizer *)recognizer
{
    CGPoint translation = [recognizer translationInView:self.view];
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        self.interactionController = [[UIPercentDrivenInteractiveTransition alloc] init];
        [self popViewControllerAnimated:YES];
    } else if (recognizer.state == UIGestureRecognizerStateChanged) {
        CGFloat d = fabs(translation.x/CGRectGetWidth(self.view.bounds));
        [self.interactionController updateInteractiveTransition:d];
    } else if (recognizer.state == UIGestureRecognizerStateEnded) {
        if ([recognizer velocityInView:self.view].x > 0) {
            [self.interactionController finishInteractiveTransition];
        } else {
            [self.interactionController cancelInteractiveTransition];
        }
        self.interactionController = nil;
    }
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
            break;
            
        case SPTransitionAnimationStyleRotateAndScaleOut:
            return [[SPRotateAndScaleOutAnimator alloc] init];
            break;
        
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

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    return self.interactionController;
}

@end
