//
//  Person.m
//  ceshihsy
//
//  Created by chaojie on 2017/7/11.
//  Copyright © 2017年 chaojie. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)showMessage{
    
    NSLog(@"name= %@,age = %@",_name,_age);
}


-(void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:_age forKey:@"age"];
    [aCoder encodeObject:_name forKey:@"name"];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    
    if (self == [super init]) {
        
        [aDecoder decodeObjectForKey:@"name"];
        [aDecoder decodeObjectForKey:@"psw"];
    }
    
    return self;
}

-(instancetype)initWithDict:(NSDictionary *)dict{
    
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
        self.name = dict[@"name"];
        self.age = dict[@"age"];
        
    }
    
    return self;
}
+(instancetype)personWithDict:(NSDictionary *)dict{
    
    return [[self alloc] initWithDict:dict];
}

@end
