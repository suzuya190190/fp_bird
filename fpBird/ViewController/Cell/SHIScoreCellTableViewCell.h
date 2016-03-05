//
//  SHIScoreCellTableViewCell.h
//  fpBird
//
//  Created by tomyKeisuke on 2015/03/02.
//  Copyright (c) 2015年 tomyAmi. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString* cellId = @"SHIScoreCellTableViewCell";

@interface SHIScoreCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *userName;

@property (weak, nonatomic) IBOutlet UILabel *score;

@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UILabel *cellRankingText;


@end
