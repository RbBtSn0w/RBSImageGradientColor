//
//  RBSGradientImageItem.m
//  RBSImageGradientColor
//
//  Created by rbbtsn0w on 08/01/2018.
//  Copyright (c) 2018 rbbtsn0w. All rights reserved.
//

#import "RBSGradientImageItem.h"

@implementation RBSGradientImageItem

- (BOOL)isEqual:(id)object{
    
    if (![object isKindOfClass:[RBSGradientImageItem class]]) {
        return NO;
    }
    
    RBSGradientImageItem *inputItem = (RBSGradientImageItem*)object;
    if (![inputItem.imageName isEqualToString:self.imageName]) {
        return NO;
    }
    if (inputItem.cacheName != self.cacheName) {
        return NO;
    }
    
    if (!(inputItem.cacheName && self.cacheName && [inputItem.cacheName isEqualToString:self.cacheName])) {
        return NO;
    }
    
    return YES;
}

@end
