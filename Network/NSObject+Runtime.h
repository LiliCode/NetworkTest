//
//  NSObject+Runtime.h
//  Network
//
//  Created by LiliEhuu on 16/12/2.
//  Copyright © 2016年 LiliEhuu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Runtime)

/**
 *  获取属性列表
 *  
 *  @return NSArray 返回属性列表名称和类型
 */
- (NSArray *)getPropertyList;

@end
