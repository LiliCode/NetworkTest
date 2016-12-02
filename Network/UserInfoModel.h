//
//  UserInfoModel.h
//  Network
//
//  Created by LiliEhuu on 16/12/1.
//  Copyright © 2016年 LiliEhuu. All rights reserved.
//

#import "BaseModel.h"

@interface UserInfoModel : BaseModel<BaseModelDelegate>

@property (strong , nonatomic) NSNumber *uid;

@property (copy , nonatomic) NSString *name;
@property (strong , nonatomic) NSNumber *sex;
@property (strong , nonatomic) NSNumber *age;

@property (copy , nonatomic) NSString *enterproseName;
@property (copy , nonatomic) NSString *job;




@end


