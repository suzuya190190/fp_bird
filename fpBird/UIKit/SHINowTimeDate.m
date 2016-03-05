//
//  SHINowTimeDate.m
//  fpBird
//
//  Created by tomyKeisuke on 2015/03/04.
//  Copyright (c) 2015年 tomyAmi. All rights reserved.
//

#import "SHINowTimeDate.h"

@implementation SHINowTimeDate

-(NSString*)nowData{
    NSDate *nowdate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd"];
    NSString *datamoji = [formatter stringFromDate:nowdate];
    return datamoji;
}
@end
