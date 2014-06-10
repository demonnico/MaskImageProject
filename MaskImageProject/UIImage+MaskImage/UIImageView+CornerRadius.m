//
//  UIImageView+CornerRound.m
//  MaskImageProject
//
//  Created by Nicholas Tau on 6/9/14.
//  Copyright (c) 2014 Nicholas Tau. All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this
// list of conditions and the following disclaimer. Redistributions in binary
// form must reproduce the above copyright notice, this list of conditions and
// the following disclaimer in the documentation and/or other materials
// provided with the distribution. Neither the name of the nor the names of
// its contributors may be used to endorse or promote products derived from
// this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.

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
