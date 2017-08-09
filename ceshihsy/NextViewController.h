//
//  NextViewController.h
//  ceshihsy
//
//  Created by chaojie on 2017/7/7.
//  Copyright © 2017年 chaojie. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NextViewControllerDelegate <NSObject>

-(void)changeTitlt:(NSString *)title;

@end

@interface NextViewController : UIViewController

@property(nonatomic,copy)void(^block)(NSMutableArray *str);

@property(nonatomic,weak)id<NextViewControllerDelegate> delegate;

@end

