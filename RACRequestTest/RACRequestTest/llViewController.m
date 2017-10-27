//
//  llViewController.m
//  RACRequestTest
//
//  Created by 陈璐 on 2017/4/13.
//  Copyright © 2017年 Chenlu. All rights reserved.
//

#import "llViewController.h"

@interface llViewController ()
@property (nonatomic, strong)NSMutableArray *data;
@end

@implementation llViewController

#pragma mark - LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *dataStr = @"月亮女神、埃及明珠、埃及女王、婆罗多舞娘、潮流小兔、（暂缺）水纹+菩提树之午夜、凤九萝、御射迭双、婴宁、迢迢牵牛星、唐门、纯阳、娃娃脸的猎人/银河妖精+龙骑士·红/继承者·黑/暗黑迷彩旋风、小雪、月亮女神、机械诱惑、凤九萝、万圣奇幻夜、小王子、瑞福迎新、吉祥花火、龙泉瀑布、Lucky Star、星月马戏团、若叶松鼠、深海+粉蓝海滨+海滩的中心+海滩漫步、（暂缺）维多利亚女仆+短款外套、深蓝眼眸+女神·行者、炽焰撒旦、黑猫汽水、雀之灵、红心公主、女仆lovelove、面包师贝拉、沙丘魅影、凡尔赛公主、天鹅湖、双鱼座、春之圆舞曲、森林女神、粉色情人节、芳辰祝福、蔷薇公主、黑猫汽水、叛逆朋克、摇滚芭比、炽焰撒旦、浓醇爱恋、万圣奇幻夜、国王赞歌、人工智能、樱花少女/远方的眷恋+绿荷、纯恋之夏、春之圆舞曲、浓醇爱恋、森林女神、粉色情人节、皇后恋曲、淑女的童话书、国王赞歌、皇家骑士、绒绒熊趣、精灵诗人、小王子、甜心王子、胡桃夹子、精灵诗人、小王子、甜心王子、胡桃夹子、（暂缺）知识就是力量+雪白马甲+直筒牛仔裤、夏日童趣、稚气棉花糖、快乐的水手、蓝茶花与绵羊、（暂缺）蝴蝶之舞+云水轩/绿荷、小雪、青团仙子、岚烟仙子、紫藤仙子、星河乞巧、鹊驾星桥、鹊桥仙、：青团仙子、岚烟仙子、紫藤仙子、雀之灵、艾叶粽香、俏春桃、吉祥花火、星河乞巧、鹊驾星桥、鹊桥仙、";
    
    NSArray *dataArr = [dataStr componentsSeparatedByString:@"、"];
    
    NSMutableDictionary *dic = [NSMutableDictionary new];
    
    for (int i = 0; i<dataArr.count; i++) {
     
        if(![dic.allKeys containsObject:dataArr[i]]){
            
            static  int count = 1;
            
            for (int j = i+1; j<dataArr.count; j++) {
                
                if ([dataArr[j] isEqualToString:dataArr[i]]) {
                    
                    count = count + 1;
                    
                }
                
                [dic setObject:@(count) forKey:dataArr[i]];
               
            }
             count = 1;
        }
        
    }
    
   
  
    
  NSArray *arrr =   [dic keysSortedByValueUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj2 compare:obj1];
    }];
    
    
    NSLog(@"%@",arrr);
}

#pragma mark - Public

#pragma mark - Private

#pragma mark - Getter

#pragma mark - Setter

@end
