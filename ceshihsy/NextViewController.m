//
//  NextViewController.m
//  ceshihsy
//
//  Created by chaojie on 2017/7/7.
//  Copyright © 2017年 chaojie. All rights reserved.
//

#import "NextViewController.h"
#import "CustomView.h"
#import "NextViewController+view.m"
#import "Person.h"

@interface NextViewController ()
{
    UITextField *_textFeild ;
}
@property (weak, nonatomic) IBOutlet UITextField *textfiled;

@property(nonatomic,strong)NSMutableArray *array;

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    NSDictionary *dic = @{@"key1":@"xiaoming",@"key2":@"daming"};
    [[NSNotificationCenter defaultCenter]postNotificationName:@"name" object:nil userInfo:dic];
    
    
    _textFeild = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    _textFeild.placeholder = @"please test";
    _textFeild.font = [UIFont systemFontOfSize:18.0];
    _textFeild.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:_textFeild];
    
    
    Person *pp = [[Person alloc] init];
    [pp setValue:@"douniwan" forKey:@"name"];
    [pp setValue:@100 forKey:@"age"];
    [pp showMessage];
    
    NSLog(@"pp name is:%@ pp age is:%@",[pp valueForKey:@"name"],[pp valueForKey:@"age"]);
    
}

- (IBAction)btnClick:(id)sender {
    
    
    if (self.block != nil) {
        
        self.block(_array = [[NSMutableArray alloc] initWithObjects:@"one",@"two",@"three",@"four",@"five", nil]);
    }
    
    if ([_delegate respondsToSelector:@selector(changeTitlt:)]) {
        
        [_delegate changeTitlt:_textFeild.text];
    }
    
    
    [self.navigationController popViewControllerAnimated:YES];
     
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
