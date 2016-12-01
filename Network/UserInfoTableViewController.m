//
//  UserInfoTableViewController.m
//  Network
//
//  Created by LiliEhuu on 16/11/30.
//  Copyright © 2016年 LiliEhuu. All rights reserved.
//

#import "UserInfoTableViewController.h"
#import "HTTPRequest.h"
#import "SVProgressHUD+Error.h"

@interface UserInfoTableViewController ()

@end

@implementation UserInfoTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    HTTPRequest *httpRequest = [HTTPRequest request];
    NSMutableDictionary *par = [NSMutableDictionary new];
    [par setObject:@(4) forKey:@"userId"];
    [par setObject:@"2000004" forKey:@"linlinacc"];
    [par setObject:@(104.06) forKey:@"loca_x"];//经度
    [par setObject:@(30.67) forKey:@"loca_y"]; //纬度
    
    NSString *url = [httpRequest createHTTPUrlWithAPIName:@"clientApigetUserInfo?" parms:[par copy] encoding:NO];
    [httpRequest GET:url parameters:nil finish:^(NSURLSessionDataTask *task, id data, NSError *error) {
        NSLog(@"data = %@", data);
        [SVProgressHUD showError:error];
    }];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


@end
