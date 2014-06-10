//
//  NTDisplayCornerRadiusCell.m
//  MaskImageProject
//
//  Created by Nicholas Tau on 6/10/14.
//  Copyright (c) 2014 Nicholas Tau. All rights reserved.
//

#import "NTDisplayCornerRadiusCell.h"

@interface NTDisplayCornerRadiusCell()
@property (nonatomic,strong) NSMutableArray * imageList;
@end

@implementation NTDisplayCornerRadiusCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imageList = [NSMutableArray array];
        
        for (int i=0; i<5; i++) {
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
        imageView.layer.cornerRadius = 20.0;
        imageView.layer.masksToBounds = YES;
        imageView.center = CGPointMake(80*imageView.tag+40, self.frame.size.height/2);
    }
}
@end
