// FirebaseMessagingFix.m
#import "FirebaseMessagingFix.h"

// Import individual frameworks directly
#import <FirebaseCore/FirebaseCore.h>
#import <FirebaseMessaging/FirebaseMessaging.h>

@implementation FirebaseMessagingFix

+ (void)load {
    // This method runs when the class is loaded
    NSLog(@"Firebase Messaging fix loaded");
}

@end
