//
//  ApplePaymentService.m
//  Payments
//
//  Created by Jimmy Hoang on 2017-06-02.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

#import "ApplePaymentService.h"

@implementation ApplePaymentService

-(void)processPaymentAmount:(NSInteger)amount {
    NSLog(@"Apple Pay has processed the payment of $%ld",amount);
}

-(BOOL)canProcessPayment {
    int decision = arc4random_uniform(2);
    if (decision == 0) {
        return NO;
    } else {
        return YES;
    }
}

@end
