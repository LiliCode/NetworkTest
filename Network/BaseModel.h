//
//  BaseModel.h
//  Network
//
//  Created by LiliEhuu on 16/12/1.
//  Copyright © 2016年 LiliEhuu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Runtime.h"

@protocol BaseModelDelegate <NSObject>
@optional
- (BOOL)createTableWithName:(NSString *)tabName;

- (BOOL)insert;

- (BOOL)remove;

- (BOOL)update;

- (BOOL)select;

@end

@interface BaseModel : NSObject


@end
