//
//  ViewController.m
//  UIViewTest
//
//  Created by Cyfuer on 2021/2/1.
//

#import "ViewController.h"
#import "TestView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     * 通过代码创建时，初始化方法调用栈
     2021-02-01 17:36:38.164551+0800 UIViewTest[38070:322884] 0x7ff7c2c154c0-----[TestView initWithFrame:]
     2021-02-01 17:36:38.164713+0800 UIViewTest[38070:322884] 0x7ff7c2c154c0-----[TestView init]

     2021-02-09 16:10:58.865015+0800 UIViewTest[6586:84582] 0x7fe2cbe0dd60-----[TestView layoutSubviews]
     2021-02-09 16:10:58.865385+0800 UIViewTest[6586:84582] 0x7fe2cbe0dd60-----[TestView drawRect:]
     */
    TestView *t0 = [[TestView alloc] init];
    t0.frame = CGRectMake(20, 20, 20, 40);
    t0.center = self.view.center;
    [self.view addSubview:t0];
    
    __block TestView *subView = nil;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"\n添加子视图");
        subView = [[TestView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        [t0 addSubview:subView];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"\n修改子视图frame");
        subView.frame = CGRectMake(0, 0, 30, 30);
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"\n修改视图frame");
        t0.frame = CGRectMake(20, 20, 40, 80);
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"\n移除子视图");
        [subView removeFromSuperview];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"\n移除视图");
        [t0 removeFromSuperview];
    });
    
    
    
    /*
     * 通过storyboard或xib创建时，初始化方法调用栈
     2021-02-01 17:39:48.959205+0800 UIViewTest[38169:325957] 0x7f8198e14040-----[TestView initWithCoder:]
     2021-02-01 17:39:48.959538+0800 UIViewTest[38169:325957] 0x7f8198e14040-----[TestView awakeFromNib]

     2021-02-01 17:39:52.717809+0800 UIViewTest[38169:325957] 0x7f8198e14040-----[TestView layoutSubviews]
     2021-02-01 17:39:52.718856+0800 UIViewTest[38169:325957] 0x7f8198e14040-----[TestView drawRect:]
     */
//    TestView *t1 = (TestView *)[ViewController loadFromNib:@"TestView"];
//    t1.frame = CGRectMake(20, 100, 20, 40);
//    t1.center = self.view.center;
//    [self.view addSubview:t1];
}

+ (instancetype)loadFromNib:(NSString *)nibName {
    UINib *nib = [UINib nibWithNibName:nibName bundle:[NSBundle mainBundle]];
    NSArray *instances = [nib instantiateWithOwner:nil options:nil];
    
    id returnInstance = (instances && instances.count ? instances.lastObject : nil);
    for (id instance in instances) {
        if ([instance isMemberOfClass:[self class]]) {
            returnInstance = instance;
            break;
        }
    }
    return returnInstance;
}


@end
