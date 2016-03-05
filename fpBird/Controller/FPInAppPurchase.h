//
//  FPInAppPurchase.h
//  fpBird
//
//  Created by tomyKeisuke on 2015/07/27.
//  Copyright (c) 2015年 tomyAmi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

@interface FPInAppPurchase : NSObject<SKPaymentTransactionObserver,SKRequestDelegate,SKProductsRequestDelegate>

+(FPInAppPurchase*)singlthon;

-(void)iAPStart;

@property(nonatomic)id dele;

@end
