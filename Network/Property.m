//
//  Property.m
//  运行时获取属性类型
//
//  Created by LiliEhuu on 16/12/2.
//  Copyright © 2016年 LiliEhuu. All rights reserved.
//

#import "Property.h"

@implementation Property

+ (instancetype)pptWithName:(NSString *)name type:(NSString *)typeName
{
    return [[self alloc] initWithName:name type:typeName];
}

- (instancetype)initWithName:(NSString *)name type:(NSString *)typeName
{
    if (self = [super init])
    {
        self.name = name;
        self.typeName = typeName;
    }
    
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"name: %@ , typeName: %@", self.name, self.typeName];
}

- (NSString *)debugDescription
{
    return [NSString stringWithFormat:@"name: %@ , typeName: %@", self.name, self.typeName];
}

@end


