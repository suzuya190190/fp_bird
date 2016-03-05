//
//  SHIRecordUpCell.m
//  fpBird
//
//  Created by tomyKeisuke on 2015/03/06.
//  Copyright (c) 2015年 tomyAmi. All rights reserved.
//

#import "SHIRecordUpCell.h"

@implementation SHIRecordUpCell


+(NSArray*)calumnName{
    return @[@"今まで倒した敵の数",@"今まで倒したタワーの数(上)",@"今まで倒したタワーの数（下）",@"一回のステージで倒した敵の最高数",@"一回のステージで倒したタワーの最高数",@"今までスルーしたタワーの数",@"一回のステージでスルーしたタワーの最高数"];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
