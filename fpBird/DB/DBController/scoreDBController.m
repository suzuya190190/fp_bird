//
//  albumDBController.m
//  DataBaseController
//
//  Created by yamagishikeisuke on 2014/05/11.
//  Copyright (c) 2014年 FMDataBase. All rights reserved.
//

#import "scoreDBController.h"

#define DB_NAME01 @"albumNames"

#define ALBUM_ID @"album_ID"

#define DAYANDNIGHT @"nameAl"

#define SCORE_NUMBER @"score_number"

@implementation scoreDBController


/**
 *  DB作成
 */
-(void)createDB{
    
    FMDatabase *db = [BaseDBController createDataBase];
    
    [db open];
    
    [db executeUpdate:@"create table "DB_NAME01"("ALBUM_ID" integer not null primary key autoincrement, "DAYANDNIGHT" text, "SCORE_NUMBER" text);"];
    
    [db close];
    
}


/**
 *  アルバムの名前
 *
 *  @param dbC (&-&).oO
 */
-(void)insertDB:(scoreDB*)dbC{
    
    FMDatabase *db = [BaseDBController createDataBase];
    
    [db open];
    
    [db beginTransaction];
    
    if(![db executeUpdate:@"insert into "DB_NAME01"("DAYANDNIGHT","SCORE_NUMBER") values (?,?);",dbC.dayAndNight,dbC.score]){
        
        [db rollback];
        
        [db close];
        
    }
    
    [db commit];
    
    [db close];
    
}

/**
 *  DB内のデーターすべて取得
 *
 *  @return 全データー
 */
-(NSArray *)selectAllDB{
    
    NSMutableArray *ary = [NSMutableArray array];
    
    FMDatabase *db = [BaseDBController createDataBase];
    
    [db open];
    
    FMResultSet *res=[db executeQuery:@"select * from "DB_NAME01"  order by "SCORE_NUMBER" desc;"];
    
    while ([res next]) {
        scoreDB *dbC = [scoreDB new];
        
        dbC.alID = [res numberForColumn:ALBUM_ID];
        
        dbC.dayAndNight = [res stringForColumn:DAYANDNIGHT];
        
        dbC.score = [res numberForColumn:SCORE_NUMBER];
        
        [ary addObject:dbC];
    }
    
    [db close];
    
    return ary;
    
}
@end
