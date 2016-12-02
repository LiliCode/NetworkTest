//
//  UserInfoModel.m
//  Network
//
//  Created by LiliEhuu on 16/12/1.
//  Copyright © 2016年 LiliEhuu. All rights reserved.
//

#import "UserInfoModel.h"

@interface UserInfoModel ()


@end

@implementation UserInfoModel

- (NSString *)tableName:(NSString *)tabName
{
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return [NSString stringWithFormat:@"%@/%@.sqlite", doc, tabName];
}

- (BOOL)createTableWithName:(NSString *)tabName
{
    
    
    return YES;
}





@end


