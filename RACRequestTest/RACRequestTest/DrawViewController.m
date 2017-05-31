//
//  DrawViewController.m
//  RACRequestTest
//
//  Created by 陈璐 on 2017/4/11.
//  Copyright © 2017年 Chenlu. All rights reserved.
//

#import "DrawViewController.h"
#import "Student+teach.h"
#import "Teacher.h"
typedef struct ListNode *list_pointer;
typedef struct ListNode
{
    int value;
    list_pointer link;
}ListNode;
list_pointer pHead;

@interface DrawViewController ()

@end

@implementation DrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    Student *xiaoming = [[Student alloc] init];
//    xiaoming.name = @"xiaoming";
//    NSLog(@"%@",xiaoming.name);
    
//    [xiaoming teachSomeboy];
//    
//    Teacher *tea = [[Teacher alloc] init];
//    [tea createLinkList];
//    [tea outputLinkList];
    
    
    UIWebView *wenview = [[UIWebView alloc] init];
    wenview.frame = self.view.frame;
    
    wenview.backgroundColor = [UIColor redColor];
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://m.gomaster.cn/index.php?c=nmcourse&a=app_detail&course_id=4267"]];
    [wenview loadRequest:request];
    
    [self.view addSubview:wenview];
    
    
    // 单击的 Recognizer
    UITapGestureRecognizer* singleRecognizer;
    singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showWebImage:)];
    singleRecognizer.numberOfTapsRequired = 1; // 单击
    [wenview addGestureRecognizer:singleRecognizer];
    
}
- (void)showWebImage:(UIGestureRecognizer *)tap {
    
}

////pHead是指向指针的指针  ListNode** p
//void addToTail(list_pointer *pHead, int value){
//    
//    list_pointer node = (list_pointer)malloc(sizeof(ListNode));
//    if (node == NULL)
//    {
//        fprintf(stderr, "Faile\n");
//        exit(1);
//    }
//    node->value = value;
//    node->link = NULL;
//    
//    if (*pHead == NULL)
//    {
//        *pHead = node;
//    }
//    else{
//        list_pointer p = *pHead;
//        while (p->link != NULL){
//            p = p->link;
//        }
//        p->link = node;
//    }
//}


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
