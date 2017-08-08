//
//  ZyyTestLoadingVC.m
//  ZyyLoadingView
//
//  Created by liguo.chen on 17/8/8.
//  Copyright © 2017年 Slience. All rights reserved.
//

#import "ZyyTestLoadingVC.h"
#import "LoadingView.h"

@interface ZyyTestLoadingVC ()

@end

@implementation ZyyTestLoadingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏的标题,背景颜色,字体大小,字体颜色
    self.navigationItem.title = @"loading";
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{
                                                                      NSFontAttributeName:[UIFont systemFontOfSize:18],
                                                                      NSForegroundColorAttributeName:[UIColor whiteColor]
                                                                      }];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //展示loading动画(此方法可以在请求之前调用 来显示loading动画)
    [LoadingView showLoadingViewToView:self.view animated:YES];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        sleep(10);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //隐藏loading图 (在请求完成之后,隐藏loading动画)
            [LoadingView hideLoadingViewForView:self.view animated:YES];
            
        });
        
    });
}

@end
