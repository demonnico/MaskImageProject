//
//  UIImageView+CornerRound.m
//  MaskImageProject
//
//  Created by Nicholas Tau on 6/10/14.
//  Copyright (c) 2014 Nicholas Tau. All rights reserved.
//

#import "UIImageView+CornerRadius.h"
#import <objc/runtime.h>
#import "UIImage+MaskImage.h"

@implementation UIImageView (CornerRadius)

-(void)setCornerRadius:(CGFloat)innerCornerRadius
{
    CGFloat connerRound = [objc_getAssociatedObject(self, @selector(cornerRadius)) floatValue];
    if (connerRound!=innerCornerRadius) {
        CALayer * layer = [self maskLayer];
        UIImage * imageWithMask = [self.image imageWithTintColor:self.backgroundColor
                                                    cornerRadius:innerCornerRadius];
        layer.contents = (id)imageWithMask.CGImage;
        [self.layer addSublayer:layer];
        
        objc_setAssociatedObject(self,
                                 @selector(cornerRadius),
                                 @(innerCornerRadius),
                                 OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}

-(CGFloat)cornerRadius
{
    return  [objc_getAssociatedObject(self, _cmd) floatValue];
}

-(CALayer*)maskLayer
{
    if (!(objc_getAssociatedObject(self, _cmd))) {
        CALayer * layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, self.layer.frame.size.width, self.layer.frame.size.height);
        objc_setAssociatedObject(self, _cmd, layer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return layer;
    }
    return objc_getAssociatedObject(self, _cmd);
}


@end
