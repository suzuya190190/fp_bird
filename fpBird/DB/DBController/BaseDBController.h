//
//  BaseDBController.h
//  DataBaseController
//
//  Created by yamagishikeisuke on 2014/04/26.
//  Copyright (c) 2014年 FMDataBase. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface BaseDBController : NSObject

+(FMDatabase*)createDataBase;

@end
