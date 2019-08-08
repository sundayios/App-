//
//  UIViewController+ZWRoute.m
//  Ymd
//
//  Created by 云免 on 2018/12/12.
//  Copyright © 2018年 云免. All rights reserved.
//

#import "UIViewController+SQRoute.h"

@implementation UIViewController (SQRoute)

- (void)sq_toLastViewController
{
    [self sq_toLastViewControllerAnimated:YES];
}

- (void)sq_toLastViewControllerAnimated:(BOOL)animated
{
    if (self.navigationController) {
        if (self.navigationController.viewControllers.count == 1) {
            if (self.presentingViewController) {
                [self dismissViewControllerAnimated:animated completion:nil];
            }
        } else {
            [self.navigationController popViewControllerAnimated:animated];
        }
    } else if(self.presentingViewController) {
        [self dismissViewControllerAnimated:animated completion:nil];
    }
}

- (void)sq_toRootViewController {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)sq_toHomeRootViewController {
    for (UIViewController *vc in self.navigationController.viewControllers) {
        if ([vc isKindOfClass:[UIViewController class]]) {//如果不行替换成自己的基类 我的基类SQBaseViewController
            [self.navigationController.tabBarController setSelectedIndex:0];
            [self.navigationController popToRootViewControllerAnimated:NO];
        }
    }
}

+ (UIViewController*)sq_currentViewController {
    UIViewController* rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    return [self sq_currentViewControllerFrom:rootViewController];
}

+ (UIViewController*)sq_currentViewControllerFrom:(UIViewController*)viewController
{
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController *)viewController;
        return [self sq_currentViewControllerFrom:navigationController.viewControllers.lastObject];
    }
    else if([viewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController *)viewController;
        return [self sq_currentViewControllerFrom:tabBarController.selectedViewController];
    }
    else if (viewController.presentedViewController != nil) {
        return [self sq_currentViewControllerFrom:viewController.presentedViewController];
    }
    else {
        return viewController;
    }
}

@end
