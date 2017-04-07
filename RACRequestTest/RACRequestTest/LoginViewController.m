//
//  LoginViewController.m
//  RACRequestTest
//
//  Created by 陈璐 on 2017/3/8.
//  Copyright © 2017年 Chenlu. All rights reserved.
//
/* 需求：1.监听两个文本框的内容，有内容才允许按钮点击
 2.默认登录请求.
 
 用MVVM：实现，之前界面的所有业务逻辑
 分析：1.之前界面的所有业务逻辑都交给控制器做处理
 2.在MVVM架构中把控制器的业务全部搬去VM模型，也就是每个控制器对应一个VM模型.
 
 步骤：1.创建LoginViewModel类，处理登录界面业务逻辑.
 2.这个类里面应该保存着账号的信息，创建一个账号Account模型
 3.LoginViewModel应该保存着账号信息Account模型。
 4.需要时刻监听Account模型中的账号和密码的改变，怎么监听？
 5.在非RAC开发中，都是习惯赋值，在RAC开发中，需要改变开发思维，由赋值转变为绑定，可以在一开始初始化的时候，就给Account模型中的属性绑定，并不需要重写set方法。
 6.每次Account模型的值改变，就需要判断按钮能否点击，在VM模型中做处理，给外界提供一个能否点击按钮的信号.
 7.这个登录信号需要判断Account中账号和密码是否有值，用KVO监听这两个值的改变，把他们聚合成登录信号.
 8.监听按钮的点击，由VM处理，应该给VM声明一个RACCommand，专门处理登录业务逻辑.
 9.执行命令，把数据包装成信号传递出去
 10.监听命令中信号的数据传递
 11.监听命令的执行时刻
 */
#import "LoginViewController.h"
#import "loginViewModel.h"
#import "loginSeccViewController.h"

@interface LoginViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userNameTField;
@property (weak, nonatomic) IBOutlet UITextField *passWordTField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (nonatomic, strong) loginViewModel *loginVM;
@property (weak, nonatomic) IBOutlet UITextView *testTextView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self bindModel];
    self.testTextView.delegate = self;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginSecc) name:@"login" object:nil];
}

- (void)loginSecc {
    loginSeccViewController *new = [[loginSeccViewController alloc] initWithNibName:@"loginSeccViewController" bundle:nil];
    [new whenfinishWork:^(NSString *response, BOOL success) {
        _testTextView.text = success?  response:nil;
        [new haveFunWithBlock:^(NSMutableDictionary *dic, BOOL success) {
            _testTextView.text = success?dic[@"haha"]:response;
        }];
        
    }];
    
    [self.navigationController pushViewController:new animated:YES];
}

- (void)bindModel {
    RAC(self.loginVM.account, username) = _userNameTField.rac_textSignal;
    RAC(self.loginVM.account, pwd) = _passWordTField.rac_textSignal;
    
    RAC(self.loginBtn, enabled) = self.loginVM.enableLoginSignal;
    [[_loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        [self.loginVM.loginCommand execute:nil];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - getter & setter

- (loginViewModel *)loginVM {
    if (_loginVM == nil) {
        _loginVM = [[loginViewModel alloc] init];
    }
    return _loginVM;
}



#pragma mark ——— UITextViewDelegate

////abc

#pragma mark - Navigation

- (void)textViewDidChange:(UITextView *)textView {
    if (textView.markedTextRange ==nil) {
        NSString *topicPattern = @"#[^#]+#";
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:topicPattern options:0 error:nil];
        NSRange range = NSMakeRange(0, textView.attributedText.length);
        NSArray *results = [regex matchesInString:textView.attributedText.string options:0 range:range];
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:textView.attributedText.string];
        for (NSTextCheckingResult *result in results) {
            [attributedString addAttributes:@{NSForegroundColorAttributeName : [UIColor redColor]} range:result.range];
        }
        textView.attributedText = attributedString;
    }
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
