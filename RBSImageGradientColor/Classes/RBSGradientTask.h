//
//  RBSGradientTask.h
//  RBSImageGradientColor
//
//  Created by rbbtsn0w on 08/01/2018.
//  Copyright (c) 2018 rbbtsn0w. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RBSGradientImageItem.h"
#import "RBSGradientItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface RBSGradientTask : NSObject

@property (nonatomic, strong) RBSGradientImageItem* imageItem;
@property (nonatomic, strong) RBSGradientItem* gradientItem;

- (void)setNeedRender;

- (void)renderContinue:(void (^__nullable)(BOOL shouldRender))shouldRender
          cancelRender:(BOOL (^__nullable)(void))cancelRender
            completion:(void (^)(UIImage*image))completion;


@end

NS_ASSUME_NONNULL_END
