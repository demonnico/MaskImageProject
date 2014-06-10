//
//  NTDisplayViewController.m
//  MaskImageProject
//
//  Created by Nicholas Tau on 6/10/14.
//  Copyright (c) 2014 Nicholas Tau. All rights reserved.
//

#import "NTDisplayViewController.h"
#import "NTDisplayMaskCell.h"
#import "NTDisplayCornerRadiusCell.h"

#define TableViewCellIdentifier @"TableViewCellIdentifier"
@implementation NTDisplayViewController

-(id)initWithDisplayStyle:(kDisplayStyle)style
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        
        if (style==kDisplayWithCornerRadius) {
            [self.tableView registerClass:[NTDisplayCornerRadiusCell class]
                   forCellReuseIdentifier:TableViewCellIdentifier];
        }else{
            [self.tableView registerClass:[NTDisplayMaskCell class]
                   forCellReuseIdentifier:TableViewCellIdentifier];
        }
    }
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark UITableViewDataSource methods
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell =
    [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

#pragma mark UITableViewDelegate methods
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 88;
}

@end
