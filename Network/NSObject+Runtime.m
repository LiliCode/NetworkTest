//
//  NSObject+Runtime.m
//  Network
//
//  Created by LiliEhuu on 16/12/2.
//  Copyright © 2016年 LiliEhuu. All rights reserved.
//

#import "NSObject+Runtime.h"
#import <objc/runtime.h>
#import "Property.h"

@implementation NSObject (Runtime)


/**
 *  获取属性类型
 */
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
        //获取属性类型
        const char *cPType = property_getType(property);
        NSString *propertyType = [NSString stringWithUTF8String:cPType];
        //创建属性类型
        Property *ppt = [Property pptWithName:propertyName type:propertyType];
        //存入数组
        [list addObject:ppt];
    }
    
    //释放属性列表
    free(propertyList);
    
    return [list copy];
}

/**
 *  获取属性类型
 */
static const char *property_getType(objc_property_t property)
{
    //获取属性
    const char *attributes = property_getAttributes(property);
    //printf("attributes=%s\n", attributes);
    char buffer[1 + strlen(attributes)];
    strcpy(buffer, attributes);
    char *state = buffer, *attribute;
    while ((attribute = strsep(&state, ",")) != NULL)
    {
        if (attribute[0] == 'T' && attribute[1] != '@')
        {
            // it's a C primitive type:
            
            // if you want a list of what will be returned for these primitives, search online for
            // "objective-c" "Property Attribute Description Examples"
            // apple docs list plenty of examples of what you get for int "i", long "l", unsigned "I", struct, etc.
            
            NSString *name = [[NSString alloc] initWithBytes:attribute + 1 length:strlen(attribute) - 1 encoding:NSASCIIStringEncoding];
            return (const char *)[name cStringUsingEncoding:NSASCIIStringEncoding];
        }
        else if (attribute[0] == 'T' && attribute[1] == '@' && strlen(attribute) == 2)
        {
            // it's an ObjC id type:
            return "id";
        }
        else if (attribute[0] == 'T' && attribute[1] == '@')
        {
            // it's another ObjC object type:
            NSString *name = [[NSString alloc] initWithBytes:attribute + 3 length:strlen(attribute) - 4 encoding:NSASCIIStringEncoding];
            return (const char *)[name cStringUsingEncoding:NSASCIIStringEncoding];
        }
    }
    
    return "";
}

@end
