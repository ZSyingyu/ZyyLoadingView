//
//  ViewController.m
//  ZyyLoadingView
//
//  Created by liguo.chen on 17/8/8.
//  Copyright © 2017年 Slience. All rights reserved.
//

#import "ViewController.h"
#import "ZyyTestLoadingVC.h"

//屏幕宽
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
//屏幕高
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏的标题,背景颜色,字体大小,字体颜色
    self.navigationItem.title = @"loading动画";
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{
                                                                      NSFontAttributeName:[UIFont systemFontOfSize:18],
                                                                      NSForegroundColorAttributeName:[UIColor whiteColor]
                                                                      }];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(20, 100, SCREEN_WIDTH - 40, 50);
    [btn setTitle:@"显示loadingView" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [btn setBackgroundColor:[UIColor cyanColor]];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

-(void)btnAction {
    
    ZyyTestLoadingVC *loadingVc = [[ZyyTestLoadingVC alloc] init];
    [self.navigationController pushViewController:loadingVc animated:YES];
    
}

@end
