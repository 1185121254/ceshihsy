//
//  NextViewController+view.m
//  ceshihsy
//
//  Created by chaojie on 2017/7/10.
//  Copyright © 2017年 chaojie. All rights reserved.
//

#import "NextViewController+view.h"

@implementation NextViewController (view)

+(UIButton *_Nullable)initWithFrame:(CGRect)frame addTitle:(NSString *_Nullable)title addTarget:(nullable id)target action:(SEL _Nullable )action forControlEvents:(UIControlEvents)controlEvents{
    
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    btn.backgroundColor = [UIColor orangeColor];
    btn.titleLabel.text = title;
    [btn addTarget:target action:action forControlEvents:controlEvents];
    
    return btn;
}

@end
