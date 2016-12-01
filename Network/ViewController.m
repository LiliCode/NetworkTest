//
//  ViewController.m
//  Network
//
//  Created by LiliEhuu on 16/11/30.
//  Copyright © 2016年 LiliEhuu. All rights reserved.
//

#import "ViewController.h"
#import "UserInfoModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UserInfoModel *info = [[UserInfoModel alloc] init];
    NSArray *list = [info getPropertyList];
    NSLog(@"%@", list);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


@end




