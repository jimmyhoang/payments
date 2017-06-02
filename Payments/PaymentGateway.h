//
//  PaymentGateway.h
//  Payments
//
//  Created by Jimmy Hoang on 2017-06-02.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PaymentGatewayDelegate;

@interface PaymentGateway : NSObject


@property (nonatomic, weak) id <PaymentGatewayDelegate> delegate;

-(void)processPaymentAmount:(NSInteger)amount;

@end

@protocol PaymentGatewayDelegate <NSObject>

-(void)processPaymentAmount:(NSInteger)amount;


@end
