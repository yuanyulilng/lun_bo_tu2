//
//  RootView.m
//  LunBoTu
//
//  Created by 袁玉灵 on 2018/7/4.
//  Copyright © 2018年 袁玉灵. All rights reserved.
//

#import "RootView.h"
#define Gao 200
#define Kuan ([UIScreen mainScreen].bounds.size.width - 20)
@implementation RootView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        NSArray *arr = [[NSBundle mainBundle] loadNibNamed:@"RootView" owner:self options:nil];
        UIView * view = [arr firstObject];
        [self addSubview:view];
        
        self.scrollView.contentSize = CGSizeMake(Kuan * 3, Gao);
        self.scrollView.pagingEnabled = YES;
        self.scrollView.scrollEnabled = YES;
        
        
        self.imageOne = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Kuan, Gao)];
        self.imageOne.image = [UIImage imageNamed:@"1.jpg"];
        [self.scrollView addSubview:self.imageOne];
        
        self.imageTwo = [[UIImageView alloc]initWithFrame:CGRectMake(Kuan, 0, Kuan, Gao)];
        self.imageTwo.image = [UIImage imageNamed:@"2.jpg"];
        [self.scrollView addSubview:self.imageTwo];
        
        self.imgeThree= [[UIImageView alloc]initWithFrame:CGRectMake(Kuan *2, 0, Kuan, Gao)];
        self.imgeThree.image = [UIImage imageNamed:@"1.jpg"];
        [self.scrollView addSubview:self.imgeThree];
        
        
        self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(150, 150, 50, 30)];
        self.pageControl.backgroundColor = [UIColor blueColor];
        [self addSubview:self.pageControl];
        self.pageControl.numberOfPages = 2;
        
        
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
