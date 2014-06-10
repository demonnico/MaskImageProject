//
//  NTDisplayViewController.h
//  MaskImageProject
//
//  Created by Nicholas Tau on 6/10/14.
//  Copyright (c) 2014 Nicholas Tau. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    kDisplayWithMask = 0,
    kDisplayWithCornerRadius
} kDisplayStyle;

@interface NTDisplayViewController : UITableViewController
-(id)initWithDisplayStyle:(kDisplayStyle)style;
@end
