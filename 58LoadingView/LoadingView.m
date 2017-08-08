//
//  LoadingView.m
//  可爱付
//
//  Created by liguo.chen on 17/7/28.
//  Copyright © 2017年 Slience. All rights reserved.
//

#import "LoadingView.h"

@interface LoadingView ()
{
    
    UIView *_backView;
    
    UIView *_loadingView;
    
    ShapeLoadingView *_shapeView;
    
}

@end

@implementation LoadingView

+(instancetype)showLoadingViewToView:(UIView *)view animated:(BOOL)animated{
    LoadingView *loading = [[self alloc] initWithFrame:view.bounds];
    [view addSubview:loading];
    [loading startLoading:animated];
    return loading;
}

+(NSInteger)hideLoadingViewForView:(UIView *)view animated:(BOOL)animated {
    NSArray *huds = [LoadingView allLoadingsForView:view];
    for (LoadingView *loading in huds) {
        [loading stopLoading:animated];
    }
    return [huds count];
}

+ (instancetype)loadingForView:(UIView *)view {
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:self]) {
            return (LoadingView *)subview;
        }
    }
    return nil;
}

+ (NSArray *)allLoadingsForView:(UIView *)view {
    NSMutableArray *huds = [NSMutableArray array];
    NSArray *subviews = view.subviews;
    for (UIView *aView in subviews) {
        if ([aView isKindOfClass:self]) {
            [huds addObject:aView];
        }
    }
    return [NSArray arrayWithArray:huds];
}

-(instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self creatLoadingView];
    }
    return self;
}

-(void)creatLoadingView {
    
    _backView = [[UIView alloc] initWithFrame:self.bounds];
    _backView.backgroundColor = [UIColor clearColor];
    [self addSubview:_backView];
    
    _loadingView = [[UIView alloc] init];
    _loadingView.frame = CGRectMake(self.frame.size.width/2-100/2, self.frame.size.height/2-120/2, 100, 120);
    _loadingView.backgroundColor = [UIColor clearColor];
    [_backView addSubview:_loadingView];
    
    _shapeView = [[ShapeLoadingView alloc] initWithFrame:CGRectMake(0, 0, 100, 120) title:@"加载中..."];
    _shapeView.backgroundColor = [UIColor clearColor];
    [_loadingView addSubview:_shapeView];

}

-(void)startLoading:(BOOL)animated {
    if (animated == YES) {
        _loadingView.alpha = 1;
        
        [_shapeView startAnimating];
    }
    
    
}

-(void)stopLoading:(BOOL)animated {
    if (animated == YES) {
        
        _loadingView.alpha = 0;
        
        [_shapeView stopAnimating];
        
        [self removeFromSuperview];
    }
    
}

@end
