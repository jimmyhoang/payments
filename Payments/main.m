//
//  main.m
//  Payments
//
//  Created by Jimmy Hoang on 2017-06-02.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaymentGateway.h"
#import "PaypalPaymentService.h"
#import "StripePaymentService.h"
#import "AmazonPaymentService.h"
#import "ApplePaymentService.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        PaymentGateway* paymentGateway = [[PaymentGateway alloc] init];
        PaypalPaymentService* paypal;
        StripePaymentService* stripe;
        AmazonPaymentService* amazon;
        ApplePaymentService* apple;
        
        
        double cartTotal = arc4random_uniform(900) + 100;
        
        // Display total to user, ask for payment type
        NSLog(@"Thanks for shopping at Acme.com");
        NSLog(@"Your total today is: $%f", cartTotal);
        NSLog(@"Please select your payment option:");
        NSLog(@"1: Paypal");
        NSLog(@"2: Stripe");
        NSLog(@"3: Amazon");
        NSLog(@"4: Apple Pay");
        
        // Get user input
        NSLog(@"> ");
        char str[100];
        fgets (str, 100, stdin);
        
        // Convert user input string to int
        NSString* inputString = [[NSString alloc] initWithUTF8String:str];
        int userInput = [inputString intValue];
        
        
        // Determine which payment service to used based on user input
        // Initialize that payment service if it hasn't been already
        switch (userInput) {
            case 1: {
                if (!paypal) {
                    paypal = [[PaypalPaymentService alloc] init];
                }
                paymentGateway.paymentDelegate = paypal;
                break;
            }
            case 2: {
                if (!stripe) {
                    stripe = [[StripePaymentService alloc] init];
                }
                paymentGateway.paymentDelegate = stripe;
                break;
            }
            case 3: {
                if (!amazon) {
                    amazon = [[AmazonPaymentService alloc] init];
                }
                paymentGateway.paymentDelegate = amazon;
                break;
            }
            case 4: {
                if (!apple) {
                    apple = [[ApplePaymentService alloc] init];
                }
                paymentGateway.paymentDelegate = apple;
                break;
            }

        }
        
        // Process payment
        [paymentGateway processPaymentAmount:cartTotal];
        
    }
    return 0;
}
