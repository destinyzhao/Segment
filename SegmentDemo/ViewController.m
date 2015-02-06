//
//  ViewController.m
//  SegmentDemo
//
//  Created by 赵进雄 on 15/1/12.
//  Copyright (c) 2015年 zhaojinxiong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) SegmentView *segView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSMutableArray *itemArray = [[NSMutableArray alloc]initWithObjects:@"周一",@"周二",@"周三",@"周四",@"周五",@"周六", nil];
    _segView = [[SegmentView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 44)];
    _segView.backgroundColor = [UIColor lightGrayColor];
    [_segView initWithItemArray:itemArray];
    _segView.selectedSegmentIndex = 5;
    _segView.segmentDelegate = self;
    [self.view addSubview:_segView];
}

- (void)selectedSegmentIndex:(NSInteger)segmentIndex
{
    NSLog(@"select is :%ld",segmentIndex);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
