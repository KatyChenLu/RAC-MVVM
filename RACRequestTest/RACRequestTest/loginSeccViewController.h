//
//  loginSeccViewController.h
//  
//
//  Created by 陈璐 on 2017/4/6.
//
//

#import <UIKit/UIKit.h>

typedef void(^responseBlock)(NSString * response,BOOL success);

@interface loginSeccViewController : UIViewController

- (void)whenfinishWork:(responseBlock)response;
- (void)haveFunWithBlock:(void(^)(NSMutableDictionary * dic,BOOL success))funBlock;
@end
