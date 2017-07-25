//
//  AView.m
//  RACRequestTest
//
//  Created by ChenLu on 2017/7/13.
//  Copyright © 2017年 Chenlu. All rights reserved.
//

#import "AView.h"

@implementation AView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s",__func__); // 重写touch方法，自己可以响应事件
    [super touchesBegan:touches withEvent:event]; // 在调用系统默认的方法，又把事件顺着响应者链条抛给上一个响应者。这就做到了一个事件，多个控件响应。
    
//    dispatch_queue_t queue = dispatch_queue_create("mingzi", DISPATCH_QUEUE_CONCURRENT);
//    
//    dispatch_sync(queue, ^{
//        NSLog(@"任务1");
//    });
//    dispatch_sync(queue, ^{
//        NSLog(@"任务2");
//    });
//    
//  
//    
//    dispatch_sync(queue, ^{
//        NSLog(@"任务3");
//    });
//    dispatch_barrier_sync(queue, ^{
//        NSLog(@"我是个可爱的路障");
//    });
//    
//    dispatch_sync(queue, ^{
//        NSLog(@"任务4");
//    });
//    
//    NSLog(@"end");
    
    
//    //创建一个队列组
//    dispatch_group_t group = dispatch_group_create();
//    
//    //创建两个不同的队列来测试
//    dispatch_queue_t queue1 = dispatch_get_global_queue(0, 0);
//    
//    dispatch_queue_t queue2 = dispatch_queue_create("yuxuan", DISPATCH_QUEUE_CONCURRENT);
//    
//    //dispatch_group_async 异步函数
//    //系统会先把任务放入队列中,然后把队列放入组中
//    //从组中把队列取出来,在从队列里取任务执行
//    dispatch_group_async(group, queue1, ^{
//        [NSThread sleepForTimeInterval:1.0];
//        NSLog(@"download 1");
//    });
//    
//    dispatch_group_async(group, queue2, ^{
//        [NSThread sleepForTimeInterval:1.0];
//        NSLog(@"download 2");
//    });
//    //给group添加一个通知,异步函数
//    //当group队列中所有任务执行完毕,就会通知group执行block
//    /*
//     * 第一个参数: 为那个队列组添加通知
//     * 第二个参数: 决定block在什么线程中执行
//     * 第三个参数: block 代码块
//     */
//    dispatch_group_notify(group, dispatch_queue_create("yuxuan1",DISPATCH_QUEUE_CONCURRENT), ^{
//        NSLog(@"OK");
//    });
//    NSLog(@"end");
    
    
//    /*
//     dispatch_group_async底层实现:
//     void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
//     {
//     dispatch_retain(group);
//     dispatch_group_enter(group);
//     dispatch_async(queue, ^{
//     block();
//     dispatch_group_leave(group);
//     dispatch_release(group);
//     });
//     }
//     */
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//    
//    //创建一个队列组
//    dispatch_group_t group =  dispatch_group_create();
//    
//    //通知队列组进入队列组
//    dispatch_group_enter(group);
//    
//    dispatch_async(queue, ^{
//        NSLog(@"111");
//        //任务执行完毕
//        //通知队列组离开队列组
//        dispatch_group_leave(group);
//    });
//    
//    //通知队列组进入队列组
//    dispatch_group_enter(group);
//    
//    dispatch_async(queue, ^{
//        NSLog(@"222");
//        //任务执行完毕
//        //通知队列组离开队列组
//        dispatch_group_leave(group);
//    });
//    
//    //等待所有任务执行完毕,一直等待.会阻塞线程
//    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
//    
//        dispatch_group_notify(group, queue, ^{
//            NSLog(@"over");
//        });
    
//    //创建一个队列,创建GCD定时器时使用
//    dispatch_queue_t queue = dispatch_queue_create("yuxuan", DISPATCH_QUEUE_SERIAL);
//    //创建一个GCD定时器(触发器)
//    //第四个参数:传入一个队列,决定了定时器回调任务执行方式.
//    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
//    //dispatch_source_t其实本质是一个类,由于是局部变量,方法执行完,就会被释放.
////    self.timer = timer;
//    //设置定时器
//    /*
//     第一个参数:给那个定时器设置
//     第二个参数:什么时候启动
//     第三个参数:间隔多久执行一次
//     第四个参数:设置精准度:0 代表最高精准(尽量让定时器精准), 大于0的的话代表是在多少秒内接受.
//     第四个参数存在意义:主要是为了提高程序性能, 设置越大,能减轻CPU的压力
//     注意:GCD定时器传入的时间都是纳秒
//     */
//    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0.0 * NSEC_PER_SEC);
//    //第一个参数:给那个定时器设置
//    //第二个参数:设置定时器回调block
//    //异步执行的,具有创建新线程的能力
//    //具体是否创建线程,创建几条线程是由定时任务创建时,传入的queue决定的
//    dispatch_source_set_event_handler(timer, ^{
//        NSLog(@"%@",[NSThread currentThread]);
//    });
//    //启动定时器
//    dispatch_resume(timer);
//
    
    
}

@end
