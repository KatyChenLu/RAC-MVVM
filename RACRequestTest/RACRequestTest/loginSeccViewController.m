//
//  loginSeccViewController.m
//  
//
//  Created by 陈璐 on 2017/4/6.
//
//

#import "loginSeccViewController.h"

@interface loginSeccViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textFld;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation loginSeccViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   [[_btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
       [self.navigationController popViewControllerAnimated:YES];
   }];
}

- (void)whenfinishWork:(responseBlock)response {
    response(@"4231",1);
    
}

- (void)haveFunWithBlock:(void(^)(NSMutableDictionary * dic,BOOL success))funBlock{
    
    NSLog(@"在网络正常的情况下,通过运算后 我们得出了一个值是100 现在 要到用这个值的地方go");
    NSMutableDictionary * dic =[NSMutableDictionary dictionary];
    [dic setObject:@"100" forKey:@"haha"];
    funBlock(dic,1);
    
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
