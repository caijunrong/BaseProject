//
//  ApiInfoModel.h
//  BaseProject
//
//  Created by biyabi on 15/05/19.
//  Copyright © 2015年 biyabi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApiInfoModel : NSObject

@property (nonatomic,copy) NSString *AppName;

@property (nonatomic,copy) NSString *ApiIP;

-(id)initWithDict:(NSDictionary *)dictionary;

//返回ApiInfoModel
+(id)ApiInfoModelWithDict:(NSDictionary *)dictionary;

@end

