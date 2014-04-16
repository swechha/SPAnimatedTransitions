//
//  FirstViewController.m
//  AnimatedTransitions
//
//  Created by Swechha Prakash on 14/04/14.
//  Copyright (c) 2014 Swechha. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "SPNavigationController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

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
    
    [self.view setBackgroundColor:[UIColor orangeColor]];
    
    UIButton *nextButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    nextButton.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [nextButton setBackgroundColor:[UIColor orangeColor]];
    [nextButton setTitle:@"Next" forState:UIControlStateNormal];
    [nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [nextButton.titleLabel setFont:[UIFont fontWithName:@"Avenir" size:32]];
    [nextButton addTarget:self action:@selector(pushNextViewController) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:nextButton];
}

- (void) pushNextViewController
{
    SPNavigationController *myNavigationController = (SPNavigationController *)self.navigationController;
    SecondViewController *secondViewController = [[SecondViewController alloc] init];
    [myNavigationController pushViewController:secondViewController usingAnimation:SPTransitionAnimationStyleScaleOut];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
