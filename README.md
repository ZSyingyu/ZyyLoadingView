# ZyyLoadingView
很方便的仿58自定义loading框

最近发现MBProgressHUD的loading框有点不好看,所以就写了这个仿58同城的加载loading界面,如果觉得这个动画不符合,可以自己写一个动画,然后调用LoadingView里的方法就可以实现你自己的loading框.(注:动画时网上找到,具体是哪个作者写的我给忘了,感谢作者的开源,如果有作者看到,可以联系我).
其实主要的方法还是可以仿照MBProgressHUD的方法写:

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

主要的就是这几个方法.
用的时候需要导入头文

    #import "LoadingView.h"

然后,在请求之前调用方法

    [LoadingView showLoadingViewToView:self.view animated:YES];

请求完成时,需要隐藏loading框

    [LoadingView hideLoadingViewForView:self.view animated:YES];

这就完成了.是不是很简单,想要换动画的话,就自己写一个专属的动画,这样就可以实现自己的加载loading框了.
