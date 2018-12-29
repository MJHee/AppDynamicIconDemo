//
//  DAppIconManager.h
//  AppDynamicIconDemo
//
//  Created by scmios on 2018/12/29.
//  Copyright © 2018年 hemengjie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DAppIconManager : NSObject

/**
 Returns the name of the icon currently in use.
 
 * If ``, the primary application icon is being used. Or the current system version is not supported.
 @return IconName
 */
+ (NSString *)getCurrentAppIconName;
/**
 Check whether the current device supports changing icon
 
 @return result, YES or NO
 */
+ (BOOL)canChangeAppIcon;

/**
 Change the icon
 
 * Pass `nil` to use the primary application icon. The completion handler will be invoked asynchronously on an arbitrary background queue; be sure to dispatch back to the main queue before doing any further UI work.
 @param iconName iconName
 @param completionHandler error or nil
 */
+ (void)changeAppIconWithIconName:(NSString *)iconName completionHandler:(nullable void (^)(NSError *_Nullable error))completionHandler NS_EXTENSION_UNAVAILABLE("Extensions may not have alternate icons");

@end

NS_ASSUME_NONNULL_END
