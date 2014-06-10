//
//  UIImage+MaskImage.h
//  MaskImageProject
//
//  Created by Nicholas Tau on 6/9/14.
//  Copyright (c) 2014 Nicholas Tau. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MaskImage)
+(UIImage*)imageWithSize:(CGSize)imageSize
               tintColor:(UIColor*)tintColor
            cornerRadius:(CGFloat)radius;
-(UIImage*)imageWithTintColor:(UIColor*)tintColor
                 cornerRadius:(CGFloat)radius;
@end
