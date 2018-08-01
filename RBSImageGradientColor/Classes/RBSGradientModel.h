//
//  RBSGradientModel.h
//  RBSImageGradientColor
//
//  Created by rbbtsn0w on 08/01/2018.
//  Copyright (c) 2018 rbbtsn0w. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RBSGradientTask.h"

NS_ASSUME_NONNULL_BEGIN

@interface RBSGradientModel : NSObject

- (void)imageGradientColorWithTask:(RBSGradientTask*)task completion:(void (^)(BOOL isCache, UIImage*image))completion;

@end

NS_ASSUME_NONNULL_END
