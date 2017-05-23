//
//  Teacher.m
//  RACRequestTest
//
//  Created by ChenLu on 2017/5/22.
//  Copyright © 2017年 Chenlu. All rights reserved.
//

#import "Teacher.h"


@interface Teacher ()
{
    id data;
    Teacher *head;
    Teacher *next;
}
@end


@implementation Teacher

-(void)teachSomeboy {
    NSLog(@"teach");
}


- (void)createLinkList {
    head = [[Teacher alloc] init];
    head->next = nil;
    Teacher *ptr = head;
    for (int i=1; i<=20; i++){
        Teacher *node = [[Teacher alloc] init];
        node->data = [NSNumber numberWithInt:i];
        node->next = nil;
        ptr->next = node;
        ptr = node;
    }
}
- (void)outputLinkList {
    Teacher *ptr = head->next;
    while (ptr != nil) {
        printf("%d ", [ptr->data intValue]);
        ptr = ptr->next;
    
    }
    printf("\n");
}

//- (void)resetLinkList:(Teacher *)link {
//    Teacher *tempHead = [self createLinkList];
//    Teacher *nextT = nil;
//    Teacher *pre = nil;
//    while (tempHead) {
//        if (tempHead == link) {
//            nextT = tempHead ->next;
//            tempHead ->next = nil;
//            pre = tempHead;
//        }else{
//            nextT = tempHead ->next;
//            tempHead ->next = pre;
//            pre = tempHead;
//        }
//        tempHead = nextT;
//        if (tempHead != nil) {
//           printf("%d ", [tempHead->data intValue]);
//        }
//    }
//}

- (void)lul{
    
}

@end
//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        Teacher *list = [[Teacher alloc] init];
//        [list createLinkList];
//        [list outputLinkList];
//    }
//    return 0;
//}

