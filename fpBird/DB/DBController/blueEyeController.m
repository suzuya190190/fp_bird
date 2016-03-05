//
//  blueEyeController.m
//  fpBird
//
//  Created by tomyKeisuke on 2015/07/29.
//  Copyright (c) 2015年 tomyAmi. All rights reserved.
//

#import "blueEyeController.h"

#define BEAMBOOL @"yesEye"
#define DB_NAMEEYE @"yes_db"

@implementation blueEyeController

/**
 *  DB作成
 */
-(void)createDB{
    
    FMDatabase *db = [BaseDBController createDataBase];
    
    [db open];
    
    [db executeUpdate:@"create table "DB_NAMEEYE"("BEAMBOOL" text);"];
    
    [db close];
    
}


/**
 *  アルバムの名前
 *
 *  @param dbC (&-&).oO
 */
-(void)insertDB:(BEAMBEAN*)dbC{
    if([self selectBool]){
        FMDatabase *db = [BaseDBController createDataBase];
        
        [db open];
        
        [db beginTransaction];
        
        if(![db executeUpdate:@"insert into "DB_NAMEEYE"("BEAMBOOL") values (?);",dbC.blueEya]){
            
            [db rollback];
            
            [db close];
            
        }
        
        [db commit];
        
        [db close];

    }
    
}

/**
 *  DB内のデーターすべて取得
 *
 *  @return 全データー
 */
-(BOOL)selectBool{
    
    BOOL beam=NO;
    
    FMDatabase *db = [BaseDBController createDataBase];
    
    [db open];
    
    FMResultSet *res=[db executeQuery:@"select * from "DB_NAMEEYE";"];
    
    while ([res next]) {
        BEAMBEAN *dbC = [BEAMBEAN new];
        
        dbC.blueEya = [res stringForColumn:BEAMBOOL];
        if(dbC.blueEya.length>0){
            beam =YES;
        }
    }
    
    [db close];
    
    return beam;
    
}

@end
