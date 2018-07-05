//
//  ViewController.m
//  LunBoTu
//
//  Created by 袁玉灵 on 2018/7/4.
//  Copyright © 2018年 袁玉灵. All rights reserved.
//

#import "ViewController.h"
#import "RootView.h"
@interface ViewController ()<UIScrollViewDelegate>
/**<#注释#> */
@property (nonatomic,strong) RootView *rootView;
/**<#注释#> */
@property (nonatomic,strong) NSTimer *timer;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.rootView = [[RootView alloc]initWithFrame:CGRectMake(10, 64, Width - 20, 200)];
    self.rootView.backgroundColor = [UIColor greenColor];
    self.rootView.scrollView.delegate = self;
  
    
    [self.view addSubview:self.rootView];
    [self addTimer];
    
    [self.rootView.pageControl addTarget:self action:@selector(pageControlAction:) forControlEvents:UIControlEventValueChanged];
    
}
-(void)pageControlAction:(UIPageControl *)pageControl{
    if (pageControl.currentPage == 0) {
        [ self.rootView.scrollView setContentOffset:CGPointMake(0, 0   ) animated:YES]; ;
    }else if(pageControl.currentPage == 1) {
       [ self.rootView.scrollView setContentOffset:CGPointMake((Width - 20), 0) animated:YES];
    }

}
-(void)addTimer{
      self.timer  = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
}
-(void)stopTimer{
    [self.timer invalidate];
    self.timer = nil;
}
-(void)timerAction{
       NSLog(@"%s",__func__);
    CGFloat x = (Width - 20);
    if (self.rootView.scrollView.contentOffset.x == 0) {
        
        [ self.rootView.scrollView setContentOffset:CGPointMake(x, 0) animated:YES];
    }else if (self.rootView.scrollView.contentOffset.x == x ){
        [ self.rootView.scrollView setContentOffset:CGPointMake(x * 2, 0) animated:YES];
    }
}
//2 6789
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%s",__func__);
}

//1
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
      NSLog(@"%s",__func__);
    [self stopTimer];
   
}
//3
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0){
      NSLog(@"%s",__func__);
}

//4
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
      NSLog(@"%s",__func__);
     if (self.rootView.scrollView.contentOffset.x == 0){
        CGFloat x = (Width -20);
        self.rootView.scrollView.contentOffset = CGPointMake(x *2, 0 );
        [ self.rootView.scrollView setContentOffset:CGPointMake(x , 0) animated:YES];
         [self addTimer];
    }
}
//5
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
      NSLog(@"%s",__func__);
}
//10
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
      NSLog(@"%s",__func__);
    if (self.rootView.scrollView.contentOffset.x == (Width -20)*2) {
        self.rootView.scrollView.contentOffset = CGPointMake(0, 0 );
    }

    if (self.rootView.scrollView.contentOffset.x == 0 || self.rootView.scrollView.contentOffset.x == (Width - 20)*2) {
        self.rootView.pageControl.currentPage = 0;
    }else{
        self.rootView.pageControl.currentPage = 1;
    }
    
    [self addTimer];
    
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
      NSLog(@"%s",__func__);
    if (self.rootView.scrollView.contentOffset.x == (Width -20)*2) {
        self.rootView.scrollView.contentOffset = CGPointMake(0, 0 );
    }
    
    if (self.rootView.scrollView.contentOffset.x == 0 || self.rootView.scrollView.contentOffset.x == (Width - 20)*2) {
        self.rootView.pageControl.currentPage = 0;
    }else{
        self.rootView.pageControl.currentPage = 1;
    }
    
}



@end
