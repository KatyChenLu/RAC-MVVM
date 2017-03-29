//
//  tabTestViewController.m
//  RACRequestTest
//
//  Created by 陈璐 on 2017/3/16.
//  Copyright © 2017年 Chenlu. All rights reserved.
//

#import "tabTestViewController.h"
#import "ViewController.h"
#import "LoginViewController.h"


@interface tabTestViewController ()<UIPageViewControllerDelegate , UIPageViewControllerDataSource>

@property(nonatomic ,strong)UIView * categoryView;

@property(nonatomic ,strong)UIView * lineView;

@property(nonatomic ,assign)NSInteger  currentTag;

@property(nonatomic ,strong)UIPageViewController * pageViewVc;

@property(nonatomic ,strong)NSArray * vcArrs;

@property(nonatomic ,strong)NSArray * btnArr;

@property (nonatomic, strong)ViewController *oneVC ;
@end

@implementation tabTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    [self creatCategaryView];
}

-(void)creatTabelView
{
    
    self.pageViewVc = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageViewVc.delegate = self;
    self.pageViewVc.dataSource = self;
    
    
    [self.pageViewVc setViewControllers:@[self.oneVC] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished) {
        
        
    }];
    
    [self addChildViewController:self.pageViewVc];
    
    
    
    self.pageViewVc.view.frame = CGRectMake(0, self.lineView.bounds.size.height+self.lineView.bounds.origin.y, self.view.bounds.size.width, 200);
    
    [self.view addSubview:self.pageViewVc.view];
    
    
    
}


-(void)creatCategaryView
{
    self.categoryView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 45)];
    
    NSMutableArray * arr = [NSMutableArray arrayWithCapacity:2];
    for ( int i = 0 ; i < 2; i++) {
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        btn.frame = CGRectMake( i*self.view.bounds.size.width/2, 0, self.view.bounds.size.width/2, 45);
        
        [btn setTitle:i==0?@"文章":@"课程" forState:UIControlStateNormal];
        
        btn.titleLabel.font = [UIFont fontWithName:@".PingFang-SC-Light" size:17];
        
        [arr addObject:btn];
        
        if ( i == 0) {
            
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
        }else{
            
            [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            
        }
        
        [btn addTarget: self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        btn .tag = i ;
        
        [self.categoryView addSubview:btn];
        
    }
    
    self.btnArr = arr;
    
    self.lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 45, self.view.bounds.size.width/2, 3)];
    self.lineView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.lineView];
    
    [self.view addSubview:self.categoryView];
    
    
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    
    if ([viewController isKindOfClass:[ViewController class]]) {
    
        return self.vcArrs[1];
    }else{
        
        return nil;
    }
    
    
}

#pragma UIPageViewControllerDelegate
- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers NS_AVAILABLE_IOS(6_0)
{
    
    NSLog(@"%@" , pendingViewControllers.firstObject);
    
}


- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed
{
    NSLog(@"---%@" , previousViewControllers.firstObject);
    
    if (finished) {
        
        NSLog(@"finished---------%@" , previousViewControllers.firstObject);
        
        [self translate:previousViewControllers.firstObject];
    }
}
-(NSArray *)vcArrs
{
    
    if (!_vcArrs) {
        
      
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        LoginViewController *twoVC = [story instantiateViewControllerWithIdentifier:@"LoginViewController"];
        
        _vcArrs = @[self.oneVC, twoVC];
    }
    
    return _vcArrs;
}


- (ViewController *)oneVC {
    if (!_oneVC) {
        _oneVC = [[ViewController alloc]init];
        
        
    }
    return _oneVC;
}

-(void)btnClick:(UIButton *)sender
{
    
    sender = self.btnArr[ sender.tag == 0 ? 0 : 1];
    
    [sender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    CGRect frame = self.lineView.frame;
    
    frame.origin.x = sender.frame.origin.x;
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.lineView.frame = frame;
        
    }];
    
    
    [self.pageViewVc setViewControllers:@[self.vcArrs[sender.tag]] direction:self.currentTag < sender.tag ? UIPageViewControllerNavigationDirectionForward :UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
    
    
    self.currentTag = sender.tag;
    
    sender = self.btnArr[sender.tag == 0 ? 1 : 0];
    
    [sender setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
}



-(void)translate:(id)vc
{
    CGRect frame = self.lineView.frame;
    
    //    frame.origin.x =
    
    if ([vc isKindOfClass:[ViewController class]]) {
        
        self.currentTag = 0;
        
        frame.origin.x = self.currentTag * self.view.bounds.size.width/2;
        
        [UIView animateWithDuration:0.3 animations:^{
            
            
            self.lineView.frame = frame;
            
        }];
        
        UIButton * sender = self.btnArr[self.currentTag];
        
        sender = self.btnArr[ sender.tag == 0 ? 0 : 1];
        
        [sender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        sender = self.btnArr[sender.tag == 0 ? 1 : 0];
        
        [sender setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
    }else if ([vc isKindOfClass:[LoginViewController class]])
    {
        self.currentTag = 1;
        
        frame.origin.x = self.currentTag * self.view.bounds.size.width/2;
        [UIView animateWithDuration:0.3 animations:^{
            
            self.lineView.frame = frame;
            
        }];
        
        UIButton * sender = self.btnArr[self.currentTag];
        
        sender = self.btnArr[ sender.tag == 0 ? 0 : 1];
        
        [sender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        sender = self.btnArr[sender.tag == 0 ? 1 : 0];
        
        [sender setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    }
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
