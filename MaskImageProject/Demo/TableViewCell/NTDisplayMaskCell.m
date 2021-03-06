//
//  NTDisplayMaskCell.m
//  MaskImageProject
//
//  Created by Nicholas Tau on 6/10/14.
//  Copyright (c) 2014 Nicholas Tau. All rights reserved.
//

#import "NTDisplayMaskCell.h"
#import "UIImageView+CornerRadius.h"

@interface NTDisplayMaskCell()
@property (nonatomic,strong) NSMutableArray * imageList;
@end

@implementation NTDisplayMaskCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imageList = [NSMutableArray array];
        
        for (int i=0; i<4; i++) {
            UIImage * imageAvatar = [UIImage imageNamed:@"avatar"];
            UIImageView * imageView = [[UIImageView alloc] initWithImage:imageAvatar];
            [self.contentView addSubview:imageView];
            [self.imageList addObject:imageView];
            imageView.tag = i;
        }
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    for (UIImageView * imageView in self.imageList) {
        imageView.center= CGPointMake(imageView.tag*80+40, self.frame.size.height/2);
        imageView.backgroundColor = self.backgroundColor;
        imageView.cornerRadius = 20.0;
    }
}

@end
