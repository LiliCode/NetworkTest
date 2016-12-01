//
//  BaseModel.m
//  Network
//
//  Created by LiliEhuu on 16/12/1.
//  Copyright © 2016年 LiliEhuu. All rights reserved.
//

#import "BaseModel.h"
#import <objc/runtime.h>

@implementation BaseModel

- (NSArray *)getPropertyList
{
    //属性个数
    unsigned int count = 0;
    NSMutableArray *list = [NSMutableArray new];
    //获取属性列表
    objc_property_t *propertyList = class_copyPropertyList(self.class, &count);
    for (unsigned int i = 0; i < count; i++)
    {
        //取出每一个属性
        objc_property_t property = *(propertyList + i);
        //获取名称
        const char *cPName = property_getName(property);
        //转化成OC字符串对象
        NSString *propertyName = [NSString stringWithCString:cPName encoding:NSUTF8StringEncoding];
        //存入数组
        [list addObject:propertyName];
    }
    
    return [list copy];
}



@end
