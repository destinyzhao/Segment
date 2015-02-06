//
//  SegmentView.m
//  SegmentDemo
//
//  Created by 赵进雄 on 15/1/12.
//  Copyright (c) 2015年 zhaojinxiong. All rights reserved.
//

#import "SegmentView.h"

#define segment_Button_Tag 40001

@implementation SegmentView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        _bottomline = [[UIView alloc]init];
        _bottomline.backgroundColor = [UIColor blueColor];
        [self addSubview:_bottomline];
    }
    return self;
}

- (void)initWithItemArray:(NSMutableArray *)items
{
    self.items = [[NSMutableArray alloc]initWithArray:items];
    _segmentWidth = self.frame.size.width/items.count;
    
    [items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIButton *segBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        segBtn.frame = CGRectMake(_segmentWidth*idx+idx*1, 0, _segmentWidth, 44);
        segBtn.backgroundColor = [UIColor clearColor];
        segBtn.tag = idx + segment_Button_Tag;
        [segBtn setTitle:[items objectAtIndex:idx] forState:UIControlStateNormal];
        segBtn.titleLabel.font = [UIFont systemFontOfSize:12.f];
        [segBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [segBtn addTarget:self action:@selector(segButtonClick:) forControlEvents:
         UIControlEventTouchUpInside];
        [self addSubview:segBtn];
    }];
}

- (void)setSelectedSegmentIndex:(NSInteger)selectedSegmentIndex
{
    UIButton *segBtn = [self getSegmentButton:selectedSegmentIndex];
    segBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16.f];
    _bottomline.frame = CGRectMake(_segmentWidth * selectedSegmentIndex + 10, 42, _segmentWidth - 15, 2);
}

- (void)segButtonClick:(UIButton *)sender
{
    NSInteger segmentIndex = sender.tag - segment_Button_Tag;
    
    [self.items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIButton *segBtn = [self getSegmentButton:idx];
        segBtn.titleLabel.font = [UIFont systemFontOfSize:12.f];
    }];
    
    UIButton *segBtn = [self getSegmentButton:segmentIndex];
     segBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16.f];
    
    [UIView animateWithDuration:0.25 animations:^{
        _bottomline.frame = CGRectMake(_segmentWidth * segmentIndex + 11, 42, _segmentWidth - 15, 2);
    } completion:^(BOOL finished) {
        
    }];
    
    if ([_segmentDelegate respondsToSelector:@selector(selectedSegmentIndex:)]) {
        [_segmentDelegate selectedSegmentIndex:segmentIndex];
    }
}

- (UIButton *)getSegmentButton:(NSInteger)btnIndex
{
     UIButton *segBtn = (UIButton *)[self viewWithTag:btnIndex+segment_Button_Tag];
    return segBtn;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
