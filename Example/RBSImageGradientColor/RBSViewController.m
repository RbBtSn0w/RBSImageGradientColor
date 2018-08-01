//
//  RBSViewController.m
//  RBSImageGradientColor
//
//  Created by rbbtsn0w on 08/01/2018.
//  Copyright (c) 2018 rbbtsn0w. All rights reserved.
//

#import "RBSViewController.h"
#import <RBSImageGradientColor/RBSGradientItem.h>
#import <RBSImageGradientColor/RBSGradientTask.h>
#import <RBSImageGradientColor/RBSGradientModel.h>
#import <RBSImageGradientColor/RBSGradientImageItem.h>

static CGFloat const kDefualtImageW = 167;
static CGFloat const kDefualtImageH = 28;

static CGFloat const kHotImageW = 195;
static CGFloat const kHotImageH = 43;

static NSString *const kCellIde = @"kCellIde";
static NSUInteger const kCellCount = 30;

@interface RBSViewController ()

@property (nonatomic, strong) RBSGradientTask *deTask;
@property (nonatomic, strong) RBSGradientTask *hotTask;
@property (nonatomic, strong) RBSGradientModel *model;

@end

@implementation RBSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *gradientColors =  @[(__bridge id)[UIColor redColor].CGColor,
                                 
                                 (__bridge id)[UIColor greenColor].CGColor,
                                 
                                 (__bridge id)[UIColor blueColor].CGColor];
    NSArray *gradientLocations = @[@(0.25), @(0.5), @(0.75)];
    
    RBSGradientItem *item = [[RBSGradientItem alloc] init];
    item.colors = gradientColors;
//    item.locations = gradientLocations;
    item.startPoint = CGPointMake(0, 0);
    item.endPoint = CGPointMake(1, 1);
    
    {
        RBSGradientImageItem *imageItem = [[RBSGradientImageItem alloc] init];
        imageItem.imageName = @"Rectangle 4";
        imageItem.cacheName = @"default";
        
        self.deTask = [[RBSGradientTask alloc] init];
        self.deTask.imageItem = imageItem;
        self.deTask.gradientItem = item;
    }
    
    {
        RBSGradientImageItem *imageItem = [[RBSGradientImageItem alloc] init];
        imageItem.imageName = @"Combined Shape";
        imageItem.cacheName = @"hot";
        self.hotTask = [[RBSGradientTask alloc] init];
        self.hotTask.imageItem = imageItem;
        self.hotTask.gradientItem = item;
    }
    
    
    self.model = [[RBSGradientModel alloc] init];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIde];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self.tableView reloadData];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIde forIndexPath:indexPath];
    if (indexPath.row % 2) {
        [self.model imageGradientColorWithTask:self.hotTask completion:^(BOOL isCache, UIImage * _Nonnull image) {
            cell.imageView.image  = image;
        }];
    } else {
        [self.model imageGradientColorWithTask:self.deTask completion:^(BOOL isCache, UIImage * _Nonnull image) {
            cell.imageView.image  = image;
        }];
    }
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return kCellCount;
}

@end

