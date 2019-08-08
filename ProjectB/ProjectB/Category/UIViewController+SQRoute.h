//
//  UIViewController+Zzwoute.h
//  Ymd
//
//  Created by 云免 on 2018/12/12.
//  Copyright © 2018年 云免. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Zzwoute)

+ (UIViewController*)sq_currentViewController;

- (void)sq_toLastViewController;
- (void)sq_toLastViewControllerAnimated:(BOOL)animated;

- (void)sq_toRootViewController;
- (void)sq_toHomeRootViewController;

@end

NS_ASSUME_NONNULL_END
