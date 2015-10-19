//
//  ApiInfoModel.m
//  BaseProject
//
//  Created by caijunrong on 15/05/19.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "ApiInfoModel.h"

@implementation ApiInfoModel
-(id)initWithDict:(NSDictionary *)dictionary{
    if (self=[super init]) {
        self.AppName = dictionary[@"AppName"];
        self.ApiIP = dictionary[@"ApiIP"];
    }
    return self;
}

+(id)ApiInfoModelWithDict:(NSDictionary *)dictionary{
    return [[self alloc]initWithDict:dictionary];
}
@end
