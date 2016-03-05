//
//  SHIRecordUpCell.h
//  fpBird
//
//  Created by tomyKeisuke on 2015/03/06.
//  Copyright (c) 2015年 tomyAmi. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString* cellRe = @"SHIRecordUpCell";

@interface SHIRecordUpCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *back_View;

@property (weak, nonatomic) IBOutlet UILabel *calumn;
@property (weak, nonatomic) IBOutlet UILabel *scoreL;

+(NSArray*)calumnName;

@end
