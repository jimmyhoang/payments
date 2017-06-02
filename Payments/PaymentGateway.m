//
//  PaymentGateway.m
//  Payments
//
//  Created by Jimmy Hoang on 2017-06-02.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

#import "PaymentGateway.h"

@implementation PaymentGateway

-(void)processPaymentAmount:(NSInteger)amount {
    
    if ([self.paymentDelegate canProcessPayment]) {
        [self.paymentDelegate processPaymentAmount:amount];
    } else  {
        NSLog(@"Sorry our services are down right now");
    }
    
}

@end
