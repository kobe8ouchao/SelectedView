//
//  ViewController.m
//  SelectedView
//
//  Created by liubei on 2019/5/2.
//  Copyright © 2019 liubei. All rights reserved.
//

#import "ViewController.h"
#import "SelectedView.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (retain, nonatomic) UIPageControl *pageControl;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //初始化scrollView
    SelectedView *selecte = [[SelectedView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-320)/2, 44, 320, 44)];
    selecte.backgroundColor = [UIColor greenColor];
    [self.view addSubview:selecte];
   
}


@end
