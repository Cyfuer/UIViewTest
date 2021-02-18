//
//  TestView.m
//  UIViewTest
//
//  Created by Cyfuer on 2021/2/1.
//

#import "TestView.h"

@implementation TestView

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"%p----%s", self, __FUNCTION__);
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        NSLog(@"%p----%s", self, __FUNCTION__);
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"%p----%s", self, __FUNCTION__);
    }
    return self;
}

+ (void)initialize
{
    if (self == [TestView class]) {
        NSLog(@"%p----%s", self, __FUNCTION__);
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"%p----%s", self, __FUNCTION__);
}

- (void)drawRect:(CGRect)rect {
    NSLog(@"%p----%s", self, __FUNCTION__);
}

- (CGSize)sizeThatFits:(CGSize)size {
    NSLog(@"%p----%s", self, __FUNCTION__);
    return [super sizeThatFits:size];
}

- (void)sizeToFit {
    NSLog(@"%p----%s", self, __FUNCTION__);
}

- (void)layoutSubviews {
    NSLog(@"%p----%s", self, __FUNCTION__);
}

- (void)didAddSubview:(UIView *)subview{
    [super didAddSubview:subview];
    NSLog(@"%p----%s", self, __FUNCTION__);
}

- (void)willRemoveSubview:(UIView *)subview{
    [super willRemoveSubview:subview];
    NSLog(@"%p----%s", self, __FUNCTION__);
}

- (void)willMoveToSuperview:(nullable UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    NSLog(@"%p----%s", self, __FUNCTION__);
}

- (void)didMoveToSuperview{
    [super didMoveToSuperview];
    NSLog(@"%p----%s", self, __FUNCTION__);
}

- (void)willMoveToWindow:(nullable UIWindow *)newWindow{
    [super willMoveToWindow:newWindow];
    NSLog(@"%p----%s", self, __FUNCTION__);
}

- (void)didMoveToWindow{
    [super didMoveToWindow];
    NSLog(@"%p----%s", self, __FUNCTION__);
}

- (void)removeFromSuperview{
    [super removeFromSuperview];
    NSLog(@"%p----%s", self, __FUNCTION__);
}

- (void)dealloc{
    NSLog(@"%p----%s", self, __FUNCTION__);
}


@end
