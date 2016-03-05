//
//  positionLatitude.m
//  DataBaseController
//
//  Created by yamagishikeisuke on 2014/04/26.
//  Copyright (c) 2014年 FMDataBase. All rights reserved.
//

#import "recordUpDBController.h"

#define DB_NAME @"recordUpDB"


#define KILL_ENEMY @"kill_enemy"

#define KILL_TOWER_TOPPER @"kill_tower_topper"

#define KILL_TOWER_DOWNER @"kill_tower_downer"

#define KILL_ENEMY_MAX @"kill_enemy_max"

#define KILL_TOWER_ONCE @"kill_tower_once"

#define ALL_THROUGH_TOWER @"all_through_tower"

#define THROUGH_TOWER_ONCE @"through_tower_once"

@implementation recordUpDBController

/**
 *  DB__CREATE
 */
-(void)createDB{
    
    FMDatabase *db=[BaseDBController createDataBase];
    
    [db open];
    /**
     *  保存する情報
     *
     *  @param autoincrement ID
     *  @param text          写真の名前
     *  @param text          撮影した日にち
     *  @param text          時間
     *  @param text          軽度
     *  @param text          緯度
     *  @param blob          画像データー
     *
     *  @return なし
     */
    [db executeUpdate:@"create table if not exists "DB_NAME"("KILL_ENEMY" text, "KILL_TOWER_TOPPER" text, "KILL_TOWER_DOWNER" text, "KILL_ENEMY_MAX" text, "KILL_TOWER_ONCE" text, "ALL_THROUGH_TOWER" text, "THROUGH_TOWER_ONCE" text);"];
    
    [db close];
    
}

-(void)insertDB:(recordUp*)dbC{
    
    FMDatabase *db = [BaseDBController createDataBase];
    
    [db open];
    [db beginTransaction];
    
    /**
     *  インサート..処理
     *
     *  @param "DB_NAME""NAME" テーブルの名前
     *  @param "DAY"           日にち
     *  @param "TIME"          時間
     *  @param "LATITUDE"      緯度
     *  @param "LONGITUDE"     軽度
     *  @param "PHOTO_DATA"    画像データー
     *
     *  @return なし
     */
    if(![db executeUpdate:@"insert into "DB_NAME"("KILL_ENEMY","KILL_TOWER_TOPPER", "KILL_TOWER_DOWNER", "KILL_ENEMY_MAX", "KILL_TOWER_ONCE", "ALL_THROUGH_TOWER","THROUGH_TOWER_ONCE") values (?,?,?,?,?,?,?);",dbC.killEnemy,dbC.kilTowerTopper,dbC.killTowerDowner,dbC.killEnemyMaxScore,dbC.killTowerOneStageScore,dbC.allThroughtTower,dbC.throughtTowerOnce]){
        
        /**
         *  インサート失敗したらロールバックして閉じます。
         */
        [db rollback];
        
        [db close];
    }
    
    [db commit];
    
    [db close];
    
}

/**
 *  DB内のデーター一括削除
 */
-(void)deleteALL_DB{
    
    FMDatabase *db = [BaseDBController createDataBase];
    
    [db open];
    
    [db executeUpdate:@"delete from "DB_NAME""];
    
    [db close];
    
}


/**
 *  DB内のデーター一括取得
 *
 *  @return すべてのデーター
 */
-(NSArray *)select_all{
    
    NSMutableArray *ary=[NSMutableArray array];
    
    FMDatabase *db = [BaseDBController createDataBase];
    
    [db open];
    
    /*FMResultSet *res=[db executeQuery:@"select * from "DB_NAME" order by "DB_ID" asc;"];
    
    while ([res next]) {
        
        recordUp *root=[recordUp new];
        
        root.idNumber       = [res numberForColumn:DB_ID];
        root.killEnemy      = [res stringForColumn:NAME];
        root.kilTowerTopper            = [res stringForColumn:DAY];
        root.killTowerDowner           = [res stringForColumn:TIME];
        root.killEnemyMaxScore       = [res stringForColumn:LATITUDE];
        root.killTowerOneStageScore      = [res stringForColumn:LONGITUDE];
        root.allThroughtTower      = [res dataForColumn:PHOTO_DATA];
        
        [ary addObject:root];
        
    }*/
    
    [db close];
    
    return ary;
    
}
@end
