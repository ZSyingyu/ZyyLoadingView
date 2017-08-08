//
//  LoadingView.h
//  可爱付
//
//  Created by liguo.chen on 17/7/28.
//  Copyright © 2017年 Slience. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShapeLoadingView.h"

@interface LoadingView : UIView

+(instancetype)showLoadingViewToView:(UIView *)view animated:(BOOL)animated;

+(NSInteger)hideLoadingViewForView:(UIView *)view animated:(BOOL)animated;

+ (instancetype)loadingForView:(UIView *)view;

+ (NSArray *)allLoadingsForView:(UIView *)view;

@end
