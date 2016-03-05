//
//  SHIScoreTable.m
//  fpBird
//
//  Created by tomyAmi on 2015/02/21.
//  Copyright (c) 2015年 tomyAmi. All rights reserved.
//

#import "SHIScoreTable.h"
#import "SHIScoreCellTableViewCell.h"
#import "animationClass.h"
#import "SHIGradationClass.h"
#import "UIColor+Hex.h"
#import "SHICornerRadius.h"
#import "SHIButtonClass.h"
#import "SHIRectMake.h"
#import "scoreDBController.h"

#import "FPInAppPurchase.h"

@interface SHIScoreTable()

@property(nonatomic)UITableView* scoreTable;
@property(nonatomic)NSArray* dbAry;

@end

@implementation SHIScoreTable

-(void)backGroundColor{
    [SHIGradationClass gradationColor:self.view.layer mine:self.view :@[@"#5856D6",@"#FF9500"]];
    
    UIButton* but=[SHIButtonClass backSeanButton:CGRectMake(20, 20, 50, 50)];
    [but addTarget:self action:@selector(backView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
    
    UIButton* but2 = [SHIButtonClass backSeanButton:CGRectMake(self.view.frame.size.width-100, 20, 50, 50)];
    [but2 setTitle:@"@" forState:UIControlStateNormal];
    [but2 addTarget:self action:@selector(iap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but2];
}

-(void)backView{
    [animationClass animateObj:self.navigationController.view.layer];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
    
    UIBarButtonItem* bar = [[UIBarButtonItem alloc]initWithTitle:@"IAP" style:UIBarButtonItemStylePlain target:self action:@selector(iap)];
    self.navigationItem.rightBarButtonItem = bar;
    
    [self scoreDBGET_];
    
    [self backGroundColor];
    [self tableViewGet];
    [self.scoreTable registerNib:[UINib nibWithNibName:cellId bundle:nil] forCellReuseIdentifier:cellId];
    
}

-(void)iap{
    [[FPInAppPurchase singlthon]iAPStart];
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
    return self.dbAry.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SHIScoreCellTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(cell == nil){
        cell = (SHIScoreCellTableViewCell*)[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    scoreDB* scoreData = [scoreDB new];
    
    scoreData = self.dbAry[indexPath.row];
    
    cell = [self rankingCellColor:cell indexNumber:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.score.text = [NSString stringWithFormat:@"score　%@",scoreData.score];
    cell.userName.text = [NSString stringWithFormat:@"%@",scoreData.dayAndNight];
    
    cell.backView.backgroundColor = [UIColor colorWithHex:@"#5856D6"];
    [SHICornerRadius cornerRadiusWithView:cell.backView radius:10.f];
    [animationClass animateObj:cell.layer];
    
    return cell;
    
}

-(SHIScoreCellTableViewCell*)rankingCellColor:(SHIScoreCellTableViewCell*)cell indexNumber:(NSIndexPath*)indexp{
    cell.cellRankingText.text = [NSString stringWithFormat:@"No.%ld",(long)indexp.row+1];
    if(indexp.row==0){
        cell.cellRankingText.textColor = [UIColor colorWithHex:@"#4A4A4A" alpha:1];
    }else if(indexp.row == 1){
        cell.cellRankingText.textColor = [UIColor colorWithHex:@"##FF3B30" alpha:1];
    }else if(indexp.row == 2){
        cell.cellRankingText.textColor = [UIColor colorWithHex:@"#FF9500" alpha:1];
    }else {
        cell.cellRankingText.textColor = [UIColor whiteColor];
    }
    return cell;
    
}

@end
