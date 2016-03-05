//
//  BaseDBController.m
//  DataBaseController
//
//  Created by yamagishikeisuke on 2014/04/26.
//  Copyright (c) 2014年 FMDataBase. All rights reserved.
//

#import "BaseDBController.h"

#define DB_NAME @"app.db"

@implementation BaseDBController


/**
 *  DBファイル生成
 *
 *  @return NSString!!!!
 */
+(FMDatabase*)createDataBase{
    
    NSArray *dbPath=NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    
    NSString *dirStr=[dbPath objectAtIndex:0];
    
    FMDatabase *db=[FMDatabase databaseWithPath:dirStr];
    
    if(![db open]){
        @throw [NSException exceptionWithName:@"DBEXpention --Dude ** ! " reason:@"couldn't open specificated db file " userInfo:nil];
    }
    
    return db;
    
}

@end
