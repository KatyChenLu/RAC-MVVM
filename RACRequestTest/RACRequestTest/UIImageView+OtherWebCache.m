//
//  UIImageView+OtherWebCache.m
//  RACRequestTest
//
//  Created by ChenLu on 2017/5/27.
//  Copyright © 2017年 Chenlu. All rights reserved.
//

#import "UIImageView+OtherWebCache.h"

@implementation UIImageView (OtherWebCache)
- (void)sd_setImageWithURL:(NSURL *)url {
    self.image = [UIImage imageNamed:@"iOS"];
}
@end
