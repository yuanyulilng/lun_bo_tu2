//
//  RootView.h
//  LunBoTu
//
//  Created by 袁玉灵 on 2018/7/4.
//  Copyright © 2018年 袁玉灵. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootView : UIView
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
/**<#注释#> */
@property (nonatomic,strong) UIImageView *imageOne;
/**<#注释#> */
@property (nonatomic,strong) UIImageView *imageTwo;
/**<#注释#> */
@property (nonatomic,strong) UIImageView *imgeThree;
/** */
@property (nonatomic,strong) UIPageControl *pageControl;

@end
