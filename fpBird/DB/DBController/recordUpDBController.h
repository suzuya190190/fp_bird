//
//  positionLatitude.h
//  DataBaseController
//
//  Created by yamagishikeisuke on 2014/04/26.
//  Copyright (c) 2014年 FMDataBase. All rights reserved.
//

#import "BaseDBController.h"
#import "recordUp.h"

@interface recordUpDBController : BaseDBController

-(void)createDB;

-(void)insertDB:(recordUp*)dbC;

-(void)deleteALL_DB;

-(NSArray *)selectAll_DB;

@end
