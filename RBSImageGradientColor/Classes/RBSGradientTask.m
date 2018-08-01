//
//  RBSGradientTask.m
//  RBSImageGradientColor
//
//  Created by rbbtsn0w on 08/01/2018.
//  Copyright (c) 2018 rbbtsn0w. All rights reserved.
//

#import "RBSGradientTask.h"

static inline const CGFloat * __nullable RBSGradientlocations(NSArray<NSNumber *> * _Nullable locations);
static inline CGPoint RBSGradientItemPointCovert(CGSize realSize, CGPoint gradientItemPoint);
static inline UIImage * RBSGradientImageBGColorRender(RBSGradientItem *gradientItem, NSString *name);

@interface RBSGradientTask ()

@property (nonatomic, assign) BOOL currentRenderFlag;

@end

@implementation RBSGradientTask

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.currentRenderFlag = YES;
    }
    return self;
}

- (void)setNeedRender {
    self.currentRenderFlag = YES;
}

- (void)renderContinue:(void (^__nullable)(BOOL shouldRender))shouldRender
          cancelRender:(BOOL (^__nullable)(void))cancelRender
            completion:(void (^)(UIImage*image))completion {
    
    
    if (shouldRender) {
        shouldRender(self.currentRenderFlag);
    }
    
    if (cancelRender && cancelRender() == YES) {
        return;
    }
    
    UIImage *renderImage = RBSGradientImageBGColorRender(self.gradientItem, self.imageItem.imageName);
    self.currentRenderFlag = NO;
    completion(renderImage);
}

@end


static inline const CGFloat * __nullable RBSGradientlocations(NSArray<NSNumber *> * _Nullable locations) {
    const CGFloat * __nullable iLocations = NULL;
    if (locations.count > 0) {
        int count = (int)locations.count;
        CGFloat glossGradientLocations[count];
        for ( int i = 0; i < count; i++ ){
            NSNumber *number = [locations objectAtIndex:(NSUInteger)i];
            glossGradientLocations[ i ] = [number floatValue];
        }
        iLocations = glossGradientLocations;
    }
    return iLocations;
}


static inline CGPoint RBSGradientItemPointCovert(CGSize realSize, CGPoint gradientItemPoint) {
    CGPoint temp = CGPointMake(realSize.width*gradientItemPoint.x, realSize.height*gradientItemPoint.y);
    NSLog(@"RBSGradientItemPointCovert: result:%@, gradientItemPoint:%@ in Size: %@",
          NSStringFromCGPoint(temp),
          NSStringFromCGPoint(gradientItemPoint),
          NSStringFromCGSize(realSize));
    return temp;
}


static inline UIImage * RBSGradientImageBGColorRender(RBSGradientItem *gradientItem, NSString *name) {
    // load the image
    UIImage *image = [UIImage imageNamed:name];
    
    UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, image.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    CGContextDrawImage(context, rect, image.CGImage);
    
    // Create gradient
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)gradientItem.colors, RBSGradientlocations(gradientItem.locations));
    CGColorSpaceRelease(colorSpace);
    
    // Apply gradient
    CGContextClipToMask(context, rect, image.CGImage);
    CGContextDrawLinearGradient(context, gradient,
                                RBSGradientItemPointCovert(image.size, gradientItem.startPoint),
                                RBSGradientItemPointCovert(image.size, gradientItem.endPoint),
                                0);
    CGGradientRelease(gradient);
    
    UIImage*gradientImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return gradientImage;
}
