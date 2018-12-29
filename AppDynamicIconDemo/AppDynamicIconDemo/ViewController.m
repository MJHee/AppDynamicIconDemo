//
//  ViewController.m
//  AppDynamicIconDemo
//
//  Created by scmios on 2018/12/29.
//  Copyright © 2018年 hemengjie. All rights reserved.
//

#import "ViewController.h"
#import "DAppIconManager.h"
#import <UserNotifications/UserNotifications.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *name = [DAppIconManager getCurrentAppIconName];
    NSLog(@"App Icon name: %@", name);
    
}

- (IBAction)changeAppIcon:(UIButton *)sender {
    
    BOOL canChangeAppIcon = [DAppIconManager canChangeAppIcon];
    NSLog(@"canChangeAppIcon value: %@", canChangeAppIcon ? @"YES" : @"NO");
    if (!canChangeAppIcon) {
        return;
    }
    NSString *name = [DAppIconManager getCurrentAppIconName];
    NSString *changeName = @"male";
    if ([name isEqualToString:@"male"]) {
        changeName = @"female";
    }
    [DAppIconManager changeAppIconWithIconName:changeName completionHandler:^(NSError * _Nullable error) {
        NSLog(@"error: %@", error);
    }];
    
}


- (IBAction)sendLocalNotice:(UIButton *)sender {
    
    if (@available(iOS 10.0, *)) {
        UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
        content.title = @"this is Notifications";
        content.subtitle = @"本地通知";
        content.body = @"推送一条本地通知";
        content.badge = @1;
        content.userInfo = @{@"type" : @"this is a userNotification"};
        //每小时重复 1 次喊我喝水
        UNTimeIntervalNotificationTrigger *trigger2 = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:60 repeats:YES];
        NSString *requestIdentifier = @"sampleRequest";
        UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:requestIdentifier content:content trigger:trigger2];
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
            if (error) {
                NSLog(@"本地消息推送失败：%@", error);
            }
        }];
    } else {
        // Fallback on earlier versions
    }
}

@end
