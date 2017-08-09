//
//  CustomView.m
//  ceshihsy
//
//  Created by chaojie on 2017/7/7.
//  Copyright © 2017年 chaojie. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
      
        UIView *aView = [[UIView alloc] init];
        aView.frame = CGRectMake(0, 0, 60, 60);
        aView.backgroundColor = [UIColor redColor];
        [self addSubview:aView];
        
        
    }
    
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
