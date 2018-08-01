//
//  RBSGradientModel.m
//  RBSImageGradientColor
//
//  Created by rbbtsn0w on 08/01/2018.
//  Copyright (c) 2018 rbbtsn0w. All rights reserved.
//

#import "RBSGradientModel.h"
@import CoreGraphics;
#import "RBSGradientItem.h"

@interface RBSGradientModel ()

@property (nonatomic, strong) NSCache<NSString*, UIImage*> *cache;

@end

@implementation RBSGradientModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cache = [[NSCache alloc] init];
    }
    return self;
}

- (void)imageGradientColorWithTask:(RBSGradientTask*)task completion:(void (^)(BOOL isCache, UIImage*image))completion{
    
    if (!task.imageItem.cacheName) {
        __weak typeof(self) weakSelf = self;
        [task renderContinue:NULL cancelRender:NULL completion:^(UIImage * _Nonnull image) {
            if (weakSelf) {
                completion(NO, image);
            }
        }];
    } else {
        NSString *cacheKey = [NSString stringWithFormat:@"%@_%@",task.imageItem.imageName, task.imageItem.cacheName];
        UIImage *cacheImage = [self.cache objectForKey:cacheKey];

        if (cacheImage) {
            __weak typeof(self) weakSelf = self;
            __block BOOL shouldRenderAgain = NO;
            [task renderContinue:^(BOOL shouldRender) {
                shouldRenderAgain = shouldRender;
            } cancelRender:^BOOL{
                return shouldRenderAgain ? NO : YES;
            } completion:^(UIImage * _Nonnull image) {
                if (weakSelf) {
                    [weakSelf.cache setObject:image forKey:cacheKey];
                    completion(NO, image);
                }
            }];
            if (shouldRenderAgain == NO) {
                completion(YES, cacheImage);
            }
        } else {
            __weak typeof(self) weakSelf = self;
            [task renderContinue:NULL cancelRender:NULL completion:^(UIImage * _Nonnull image) {
                if (weakSelf) {
                    [weakSelf.cache setObject:image forKey:cacheKey];
                    completion(NO, image);
                }
            }];
        }
    }
}



@end


