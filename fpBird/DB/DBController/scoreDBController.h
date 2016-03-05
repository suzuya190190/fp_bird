//
//  albumDBController.h
//  DataBaseController
//
//  Created by yamagishikeisuke on 2014/05/11.
//  Copyright (c) 2014年 FMDataBase. All rights reserved.
//

#import "BaseDBController.h"
#import "scoreDB.h"

@interface scoreDBController : BaseDBController

-(void)createDB;

-(void)insertDB:(scoreDB*)dbC;

-(NSArray *)selectAllDB;

@end
