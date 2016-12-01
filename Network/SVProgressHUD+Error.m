//
//  SVProgressHUD+Error.m
//  Network
//
//  Created by LiliEhuu on 16/11/30.
//  Copyright © 2016年 LiliEhuu. All rights reserved.
//

#import "SVProgressHUD+Error.h"

@implementation SVProgressHUD (Error)

+ (void)showError:(NSError *)error
{
    if (!error || !error.localizedDescription.length)
    {
        return;
    }
    
    [SVProgressHUD showInfoWithStatus:error.localizedDescription];
}

@end


