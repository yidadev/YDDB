//
//  ViewController.m
//  YDDB
//
//  Created by Wei Zhang on 2018/11/6.
//  Copyright © 2018 Wei Zhang. All rights reserved.
//

#import "ViewController.h"
#import "YDCacheModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    YDCacheModel *cacheModel = [[YDCacheModel alloc] init];
    
    [cacheModel prepareForCacheToDB];
}


@end
