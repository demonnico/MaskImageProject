//
//  UIImage+MaskImage.m
//  MaskImageProject
//
//  Created by Nicholas Tau on 6/9/14.
//  Copyright (c) 2014 Nicholas Tau. All rights reserved.
//

#import "UIImage+MaskImage.h"

@implementation UIImage (MaskImage)
+(UIImage*)imageWithSize:(CGSize)imageSize
               tintColor:(UIColor*)tintColor
            cornerRadius:(CGFloat)radius
{
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    [tintColor setFill];
    CGRect rectImage =
    CGRectMake(0, 0, imageSize.width, imageSize.height);
    UIBezierPath * rectPath =
    [UIBezierPath bezierPathWithRect:rectImage];
    [rectPath fill];

    UIBezierPath * bezierPath =
    [UIBezierPath bezierPathWithRoundedRect:rectImage
                               cornerRadius:radius];
    [bezierPath fillWithBlendMode:kCGBlendModeClear
                            alpha:1.0];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

-(UIImage*)imageWithTintColor:(UIColor*)tintColor
                 cornerRadius:(CGFloat)radius
{
    UIImage * coverImage = [UIImage imageWithSize:self.size
                                        tintColor:tintColor
                                     cornerRadius:radius];
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    [self drawAtPoint:CGPointZero];
    [coverImage drawAtPoint:CGPointZero];
    UIImage * imageComposed = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imageComposed;
}
@end

