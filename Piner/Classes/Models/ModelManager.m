//
//  ModelManager.m
//  Piner
//
//  Created by Gamy on 14-1-7.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import "ModelManager.h"

@implementation ModelManager

NSString *desc = @"新华网北京1月6日电（记者徐京跃、顾瑞珍）中共中央总书记、国家主席、中央军委主席习近平6日上午在北京人民大会堂会见探月工程嫦娥三号任务参研参试人员代表，代表党中央、国务院、中央军委，向嫦娥三号任务圆满成功表示热烈的祝贺，向参加任务的广大参研参试人员表示诚挚的慰问和新年的祝福。他强调，科技创新是提高社会生产力和综合国力的战略支撑，必须把科技创新摆在国家发展全局的核心位置，坚持走中国特色自主创新道路，敢于走别人没有走过的路，不断在攻坚克难中追求卓越，加快向创新驱动发展转变。\n党和国家领导人李克强、张德江、俞正声、刘云山、王岐山、张高丽参加会见。\n人民大会堂北大厅里，洋溢着热烈的气氛。上午10时许，习近平等中央领导同志来到参研参试人员代表中间，全场响起热烈的掌声。习近平等同代表们热情握手，同探月工程总指挥、总设计师等同志亲切交谈，询问他们工作和身体情况，并同大家合影留念。\n随后，习近平发表了重要讲话，他指出，嫦娥三号任务圆满成功，为我国航天事业发展树立了新的里程碑，在人类攀登科技高峰征程中刷新了中国高度。我们把“玉兔号”的足迹刻在了月球上，也把中华民族非凡的创造力刻在了人类文明发展的光辉史册上。你们作出的卓越贡献、立下的卓越功勋，祖国和人民将永远铭记。\n　　习近平强调，探月工程任务连续成功，创造了世界月球探测史的中国纪录。这一成就，凝结的是几代航天人的智慧和心血，依靠的是我们国家的综合实力，汇聚的是中国人民的整体力量，体现出的最重要意义就是进一步增强了全国各族人民坚持和发展中国特色社会主义的决心和自信。";



+ (Activity *)genActivity
{
    
    NSArray *images = @[
                        @"http://localhost:3000/group_image/20140106/106835f0-76b5-11e3-bdd0-28cfdae2f296.jpg",
                        @"http://localhost:3000/group_image/20140106/a77d5d30-76a1-11e3-aa81-28cfdae2f296.jpg",
                        @"http://localhost:3000/group_image/20140106/c8f18ba0-76b8-11e3-bdd0-28cfdae2f296.jpg",
                        
                        ];

    
    NSManagedObjectContext *context = [NSManagedObjectContext mainContext];
    User *host = [User insertInContext:context];
    host.nick = @"甘米要很长的昵称";
    host.avatar = @"http://tp2.sinaimg.cn/1843913657/180/5663565806/1";
    
    Activity *activity = [Activity insertInContext:context];
    activity.host = host;
    
    NSInteger len = (rand() % [desc length]);
    len = MAX(2, len);
    activity.desc = [desc substringToIndex:len];
    activity.createDate = [NSDate dateWithTimeIntervalSinceNow:-rand()];
    NSInteger index = rand()%6;
    if (index < [images count]) {
        activity.image = images[index];
    }
    return activity;
}

+ (NSArray *)genActivityList:(NSInteger)count
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:count];
    for (NSInteger i = 0; i < count; ++ i) {
        [array addObject:[self genActivity]];
    }
    return array;
}


@end
