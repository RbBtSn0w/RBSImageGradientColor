//
//  RBSGradientItem.m
//  RBSImageGradientColor
//
//  Created by rbbtsn0w on 08/01/2018.
//  Copyright (c) 2018 rbbtsn0w. All rights reserved.
//

#import "RBSGradientItem.h"

@implementation RBSGradientItem

- (instancetype)init{
    self = [super init];
    if (self) {
        self.startPoint = CGPointMake(0.5, 0);//[.5, 0];
        self.endPoint = CGPointMake(0.5, 1);//[.5, 1];
        self.type = kCAGradientLayerAxial;
    }
    return self;
}

@end

