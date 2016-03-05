//
//  FPInAppPurchase.m
//  fpBird
//
//  Created by tomyKeisuke on 2015/07/27.
//  Copyright (c) 2015年 tomyAmi. All rights reserved.
//

#import "FPInAppPurchase.h"
#import "blueEyeController.h"
#import "SHIAlertView.h"

@implementation FPInAppPurchase

+(FPInAppPurchase*)singlthon{
    static dispatch_once_t once;
    static FPInAppPurchase* fpInstance;
    dispatch_once(&once, ^{
        fpInstance = [[FPInAppPurchase alloc]init];
    });
    return fpInstance;
}

-(instancetype)init{
    self = [super init];
    if(self){}
    return self;
}


-(void)iAPStart{
    if(![SKPaymentQueue canMakePayments]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"エラー"
                                                        message:@"アプリ内課金が制限されています。"
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"OK", nil];
        [alert show];
    }else{
        [self remiginTransaction];
        [self res];
    }
}

-(void)remiginTransaction{
    NSLog(@"%d",[SKPaymentQueue defaultQueue].transactions.count);
    if([SKPaymentQueue defaultQueue].transactions.count > 0){
        for(SKPaymentTransaction* product in [SKPaymentQueue defaultQueue].transactions){
            if(product.transactionState != SKPaymentTransactionStatePurchased){
                [[SKPaymentQueue defaultQueue]finishTransaction:product];
            }
        }
    }
}

-(void)res{
    NSSet *set = [NSSet setWithObjects:@"com.shichimi.tir", nil];
    SKProductsRequest *productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:set];
    productsRequest.delegate = self;
    [productsRequest start];
}

-(void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response{
    if ([response.invalidProductIdentifiers count] > 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"エラー"
                                                        message:@"アイテムIDが不正です。"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    // 購入処理開始(「iTunes Storeにサインイン」ポップアップが表示)
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    for (SKProduct *product in response.products) {
        SKPayment *payment = [SKPayment paymentWithProduct:product];
        [[SKPaymentQueue defaultQueue] addPayment:payment];
    }
}

- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions
{
    for (SKPaymentTransaction *transaction in transactions) {
        switch (transaction.transactionState) {
            case SKPaymentTransactionStatePurchasing:
                // NSLog(@"購入処理中");
                // TODO: インジケータなど回して頑張ってる感を出す。
                break;
            case SKPaymentTransactionStatePurchased:{
                
                
                // NSLog(@"購入成功");
                // TODO: アイテム購入した処理（アップグレード版の機能制限解除処理等）
                // TODO: 購入の持続的な記録
                [self blu];
                [queue finishTransaction:transaction];
            }
                break;
            case SKPaymentTransactionStateFailed:
                [queue finishTransaction:transaction];
                [[SHIAlertView ins]showtitle:@"通信エラー" msg:@"つながりません" delete:self.dele];
                                 // NSLog(@"購入失敗: %@, %@", transaction.transactionIdentifier, transaction.error);
                // TODO: 失敗のアラート表示等
                break;
            case SKPaymentTransactionStateRestored:
                // リストア処理
                // NSLog(@"以前に購入した機能を復元");
                [queue finishTransaction:transaction];
                // TODO: アイテム購入した処理（アップグレード版の機能制限解除処理等）
                break;
            default:
                [queue finishTransaction:transaction];
                break;
        }
    }
}

-(void)blu{
    blueEyeController* blue = [blueEyeController new];
    [blue createDB];
    BEAMBEAN* bea = [BEAMBEAN new];
    bea.blueEya = @"frfrfr";
    [blue insertDB:bea];
}

- (void)paymentQueue:(SKPaymentQueue *)queue removedTransactions:(NSArray *)transactions
{
    [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
}

@end
