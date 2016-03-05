//
//  rootDB.h
//  DataBaseController
//
//  Created by yamagishikeisuke on 2014/04/21.
//  Copyright (c) 2014年 FMDataBase. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface recordUp : NSObject


/**
 *  今まで倒した敵の数の合計
 */
@property(nonatomic)NSString *killEnemy;

/**
 *  いままで倒したタワーの数上
 */
@property(nonatomic)NSString *kilTowerTopper;


/**
 *  今まで倒したたわーの数下
 */
@property(nonatomic)NSString *killTowerDowner;


/**
 *  一回のステージで倒した敵の最高回数
 */
@property(nonatomic)NSString *killEnemyMaxScore;

/**
 *  一回のステージで倒したタワーの数
 */
@property(nonatomic)NSString *killTowerOneStageScore;

/**
 *  いままで飛越したタワーの間の合計
 */
@property(nonatomic)NSString *allThroughtTower;

/*
 *　一回のステージで飛び越したタワーの最高回数
 *
 */
@property(nonatomic)NSString* throughtTowerOnce;

@end
