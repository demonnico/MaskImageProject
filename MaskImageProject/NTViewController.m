//
//  NTViewController.m
//  MaskImageProject
//
//  Created by Nicholas Tau on 6/9/14.
//  Copyright (c) 2014 Nicholas Tau. All rights reserved.
//

#import "NTViewController.h"
#import "NTDisplayViewController.h"

@interface NTViewController ()

@end

@implementation NTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(UIButton*)sender {
    NTDisplayViewController * controller =
    [[NTDisplayViewController alloc] initWithDisplayStyle:sender.tag];
    
    [self.navigationController pushViewController:controller
                                         animated:YES];
}
@end
