//
//  main.m
//  Payments
//
//  Created by Jimmy Hoang on 2017-06-02.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaymentGateway.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int cartTotal = arc4random_uniform(900) + 100;
        
        // Display total to user, ask for payment type
        NSLog(@"Thanks for shopping at Acme.com");
        NSLog(@"Your total today is: %d", cartTotal);
        NSLog(@"Please select your payment option:");
        NSLog(@"1: Paypal");
        NSLog(@"2: Stripe");
        NSLog(@"3: Amazon");
        
        // Get user input
        NSLog(@"> ");
        char str[100];
        fgets (str, 100, stdin);
        
        // Convert user input string to int
        NSString* inputString = [[NSString alloc] initWithUTF8String:str];
        int userInput = [inputString intValue];
        PaymentGateway* paymentGateway = [[PaymentGateway alloc] init];
        [paymentGateway processPaymentAmount:userInput];
        
        NSLog(@"%d", userInput);
        
    }
    return 0;
}
