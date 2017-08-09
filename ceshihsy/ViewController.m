//
//  ViewController.m
//  ceshihsy
//
//  Created by chaojie on 2017/7/7.
//  Copyright © 2017年 chaojie. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
#import "Person.h"
#import "Account.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,NextViewControllerDelegate>
{
    
    UITableView *_tableview;
    Person *_pp;
    Account *_acc;
    UILabel *_testLabel;
}
@property (weak, nonatomic) IBOutlet UILabel *label;

@property(nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"title";
    
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithTitle:@"right" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarBtnClick:)];
    self.navigationItem.rightBarButtonItem = rightBar;

    
//    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
//    _tableview.delegate =self;
//    _tableview.dataSource = self;
//    _tableview.rowHeight = 60;
//    [self.view addSubview:_tableview];

    
//    NSString *str=@"abc |def |ghi |gkl |hno |pqr |stu ";
//    NSArray *arr=[str componentsSeparatedByString:@"|"];
//    NSLog(@"arr:%@",arr);


    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notifi:) name:@"name" object:nil];
    
    Person *pp = [[Person alloc] init];
    [pp setValue:@"huangshunyi" forKey:@"name"];
    [pp setValue:@"xungeer" forKey:@"age"];
    [pp showMessage];
    
    NSLog(@"pp name is: %@,psw is:%@",pp.name,[pp valueForKey:@"age"]);
    
    
    _acc = [[Account alloc] init];
    [_acc setValue:@"huangshunyi" forKey:@"name"];
    [_acc setValue:@"this is my psw" forKey:@"psw"];
    
    [_acc addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    _testLabel = [[UILabel alloc] init];
    _testLabel.frame = CGRectMake(0, 100, 100, 30);
    _testLabel.text = [_acc valueForKey:@"name"];
    _testLabel.textColor = [UIColor orangeColor];
    [self.view addSubview:_testLabel];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 200, 100, 30);
    [btn setTitle:@"btn" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    

    
}

-(void)btnClick:(UIButton *)btn{
    
    btn.selected = ! btn.selected;
    
    if (btn.selected) {
        
        [_acc setValue:@"other name" forKey:@"name"];

    }else{
        
        [_acc setValue:@"huanghsunyi" forKey:@"name"];
    }
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    if ([keyPath isEqualToString:@"name"]) {
        
        _testLabel.text = [_acc valueForKey:@"name"];
        
        NSLog(@"this is good!");
    }
    
}


-(void)notifi:(NSNotification *)notifi{
    
    self.navigationItem.rightBarButtonItem.title = notifi.userInfo[@"key1"];
    
}

-(void)dealloc{
    
    //移除通知
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"name" object:nil];
    
    //移除kvo
    
    [self removeObserver:self forKeyPath:@"name" context:nil];
}
-(void)changeTitlt:(NSString *)title{
    
    self.navigationItem.title = title;
    
}

-(void)rightBarBtnClick:(UIBarButtonItem *)right{
    
    
    
    __weak ViewController *blockSelf = self;
    
    NextViewController *nextVC = [[NextViewController alloc] init];

    nextVC.delegate = self;
    
    
   nextVC.block = ^(NSMutableArray *str) {
     
       blockSelf.dataArray = str;
       
       [_tableview reloadData];
   };
    
    [self.navigationController pushViewController:nextVC animated:YES];
  
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArray.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *str = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    cell.textLabel.text = _dataArray[indexPath.row];
    
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
