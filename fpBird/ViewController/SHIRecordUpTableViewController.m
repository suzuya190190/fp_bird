//
//  SHIRecordUpTableViewController.m
//  fpBird
//
//  Created by tomyKeisuke on 2015/03/06.
//  Copyright (c) 2015年 tomyAmi. All rights reserved.
//

#import "SHIRecordUpTableViewController.h"
#import "SHIRecordUpCell.h"
#import "animationClass.h"
#import "SHIGradationClass.h"
#import "UIColor+Hex.h"
#import "SHICornerRadius.h"
#import "SHIButtonClass.h"
#import "SHIRectMake.h"
#import "scoreDBController.h"


@interface SHIRecordUpTableViewController ()
@property(nonatomic)UITableView* scoreTable;
@property(nonatomic)NSArray* dbAry;
@end

@implementation SHIRecordUpTableViewController

-(void)backGroundColor{
    
    [SHIGradationClass gradationColor:self.view.layer mine:self.view :@[@"#1AD6FD",@"#1D62F0"]];
    
    UIButton* but=[SHIButtonClass backSeanButton:CGRectMake(20, 20, 50, 50)];
    [but addTarget:self action:@selector(backView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
}

-(void)backView{
    [animationClass animateObj:self.navigationController.view.layer];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self scoreDBGET_];
    
    [self backGroundColor];
    [self tableViewGet];
    [self.scoreTable registerNib:[UINib nibWithNibName:cellRe bundle:nil] forCellReuseIdentifier:cellRe];
    
}

-(void)scoreDBGET_{
    self.dbAry = [NSArray array];
    scoreDBController* scoreCont = [scoreDBController new];
    self.dbAry = [scoreCont selectAllDB];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

-(void)tableViewGet{
    self.scoreTable = [[UITableView alloc]initWithFrame:[SHIRectMake fullScreenAndDownRect:self.view]];
    self.scoreTable.backgroundColor = [UIColor clearColor];
    self.scoreTable.delegate = self;
    self.scoreTable.dataSource = self;
    self.scoreTable.rowHeight = 100;
    self.scoreTable.separatorColor = [UIColor clearColor];
    self.scoreTable.allowsSelection = NO;
    [self.view addSubview:self.scoreTable];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [SHIRecordUpCell calumnName].count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SHIRecordUpCell* cell = [tableView dequeueReusableCellWithIdentifier:cellRe];
    if(cell == nil){
        cell = (SHIRecordUpCell*)[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellRe];
    }
    scoreDB* scoreData = [scoreDB new];
    
    scoreData = self.dbAry[indexPath.row];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.calumn.text = [NSString stringWithFormat:@"%@",[SHIRecordUpCell calumnName][indexPath.row]];
    cell.scoreL.text = [NSString stringWithFormat:@"%@",scoreData.dayAndNight];
    cell.back_View.backgroundColor = [UIColor colorWithHex:@"#FF4981"];
    cell.calumn.textColor = [UIColor colorWithHex:@"#81F3FD" alpha:9.0];
    [SHICornerRadius cornerRadiusWithView:cell.back_View radius:10.f];
    [animationClass animateObj:cell.layer];
    
    return cell;
    
}
//
//-(SHIScoreCellTableViewCell*)rankingCellColor:(SHIScoreCellTableViewCell*)cell indexNumber:(NSIndexPath*)indexp{
//    cell.cellRankingText.text = [NSString stringWithFormat:@"No.%ld",(long)indexp.row+1];
//    if(indexp.row==0){
//        cell.cellRankingText.textColor = [UIColor colorWithHex:@"#4A4A4A" alpha:1];
//    }else if(indexp.row == 1){
//        cell.cellRankingText.textColor = [UIColor colorWithHex:@"##FF3B30" alpha:1];
//    }else if(indexp.row == 2){
//        cell.cellRankingText.textColor = [UIColor colorWithHex:@"#FF9500" alpha:1];
//    }else {
//        cell.cellRankingText.textColor = [UIColor whiteColor];
//    }
//    return cell;
//    
//}

@end
