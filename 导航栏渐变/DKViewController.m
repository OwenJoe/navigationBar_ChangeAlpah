//
//  ViewController.m
//  导航栏渐变
//
//  Created by imac on 16/5/27.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "DKViewController.h"

@interface DKViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *dkTableView;
@end

@implementation DKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    [self.view addSubview:self.dkTableView];
    
}

-(UITableView *)dkTableView{

    if (!_dkTableView) {
        
        _dkTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _dkTableView.delegate =self;
       _dkTableView.dataSource = self;
    }
    return _dkTableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *iDs = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iDs];
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:iDs];
        cell.textLabel.text = @"中国人";
    }
    return cell;
}


/**
 *  这里最主要的代码,通过滑动,改变透明度
 *
 *  @param scrollView <#scrollView description#>
 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    self.navigationController.navigationBar.alpha = scrollView.contentOffset.y/100;
}
@end







