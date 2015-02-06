//
//  SegmentView.h
//  SegmentDemo
//
//  Created by 赵进雄 on 15/1/12.
//  Copyright (c) 2015年 zhaojinxiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol segmentDelegate;

@interface SegmentView : UIView

@property (nonatomic, retain) NSMutableArray *items;
@property (nonatomic, assign) NSInteger selectedSegmentIndex;
@property (nonatomic, readwrite) CGFloat animationDuration;
@property (nonatomic, strong) UIView *bottomline;
@property (nonatomic, assign) CGFloat segmentWidth;
@property (nonatomic, assign) id<segmentDelegate>segmentDelegate;

- (void)initWithItemArray:(NSMutableArray *)items;

@end

@protocol segmentDelegate <NSObject>

- (void)selectedSegmentIndex:(NSInteger)segmentIndex;

@end
