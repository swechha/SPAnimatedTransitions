//
//  SecondViewController.m
//  AnimatedTransitions
//
//  Created by Swechha Prakash on 14/04/14.
//  Copyright (c) 2014 Swechha. All rights reserved.
//

#import "SecondViewController.h"
#import "SPNavigationController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor darkGrayColor]];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    backButton.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [backButton setBackgroundColor:[UIColor clearColor]];
    [backButton setTitle:@"Back" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton.titleLabel setFont:[UIFont fontWithName:@"Avenir" size:32]];
    [backButton addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:backButton];
}

- (void)popViewController
{
    SPNavigationController *myNavigationController = (SPNavigationController *)self.navigationController;
    [myNavigationController popViewControllerUsingAnimation:SPTransitionAnimationStyleSpringLeftToRight];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
