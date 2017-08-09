//
//  Person.h
//  ceshihsy
//
//  Created by chaojie on 2017/7/11.
//  Copyright © 2017年 chaojie. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Account;

@interface Person : NSObject<NSCoding>

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *age;
@property (nonatomic,strong) NSString *height;
@property (nonatomic,strong) NSString *weight;
@property (nonatomic,strong) NSString *sex;


@property(nonatomic,strong)Account *account;

-(void)showMessage;


-(void)encodeWithCoder:(NSCoder *)aCoder;

-(instancetype)initWithCoder:(NSCoder *)aDecoder;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)personWithDict:(NSDictionary *)dict;

@end
