//
//  UIImageView+MyWebCache.m
//  RACRequestTest
//
//  Created by ChenLu on 2017/5/27.
//  Copyright © 2017年 Chenlu. All rights reserved.
//

#import "UIImageView+MyWebCache.h"


@implementation UIImageView (MyWebCache)
- (void)sd_setImageWithURL:(NSURL *)url {
    self.image = [UIImage imageNamed:@"hongtaoA"];
//    self.image = [UIImage sd_imageWithData:[NSData dataWithContentsOfURL:url]];
}
@end
