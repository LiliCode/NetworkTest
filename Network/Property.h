//
//  Property.h
//  运行时获取属性类型
//
//  Created by LiliEhuu on 16/12/2.
//  Copyright © 2016年 LiliEhuu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Property : NSObject

@property (copy , nonatomic) NSString *name;
@property (copy , nonatomic) NSString *typeName;

+ (instancetype)pptWithName:(NSString *)name type:(NSString *)typeName;


@end
