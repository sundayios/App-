//
//  AppDelegate.m
//  ProjectB
//
//  Created by yunmian on 2019/8/7.
//  Copyright © 2019 James. All rights reserved.
//

#import "AppDelegate.h"
#import "UIViewController+SQRoute.h"
#import "UtilTool.h"

@interface AppDelegate ()
{
    BOOL isSDKCallback;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
   
    return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    
    if ([url.scheme isEqualToString:@"ProjectB"]){
        self.urlNav = url;
    }
    //      也可判别调用
    //    ///////这个判断语句可能不需要 根据实际情况
    //    if (是微信) {
    //        //调用微信
    //    }else if(支付宝){
    //        //调用支付宝
    //    }else if(自己的URLSchme){
    //        //保存自己在appdelegate.h中添加的urlNav
    //    }else{
    //          self.urlNav = url;
    //    }
    
    ////如果加入了微信支付的话----调用
    //    return  [WXApi handleOpenURL:url delegate:[ZWWechatManager sharedInstance]];
    
    return YES;
    
    
    
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    isSDKCallback = YES;
    //  URLSchemes://schemeIdtifer/地址路径？参数
    //  ProjectB://com.shaoqing.B/open/goods?id=商品id&type=商品类型
    if ([url.host isEqualToString:@"safepay"]) {
        // 支付跳转支付宝钱包进行支付，处理支付结果
//        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
//            UIViewController *currentVC = [UIViewController zw_currentViewController];
//            UIViewController *lastVC = currentVC.navigationController.viewControllers.lastObject;
//            if ([lastVC isKindOfClass:[ZWGoodsPayViewController class]]) {
//                [[NSNotificationCenter defaultCenter] postNotificationName:kZWPayCallbackNotification object:nil];
//            }else {
//                [[NSNotificationCenter defaultCenter] postNotificationName:kZWPaymentCallbackNotification object:nil];
//            }
//
//        }];
        
        // 授权跳转支付宝钱包进行支付，处理支付结果
//        [[AlipaySDK defaultService] processAuth_V2Result:url standbyCallback:^(NSDictionary *resultDic) {
//            UIViewController *currentVC = [UIViewController zw_currentViewController];
//            UIViewController *lastVC = currentVC.navigationController.viewControllers.lastObject;
//            if ([lastVC isKindOfClass:[ZWGoodsPayViewController class]]) {
//                [[NSNotificationCenter defaultCenter] postNotificationName:kZWPayCallbackNotification object:nil];
//            }else {
//                [[NSNotificationCenter defaultCenter] postNotificationName:kZWPaymentCallbackNotification object:nil];
//            }
//        }];
    } else if ([url.scheme isEqualToString:@"ProjectB"]) {
        self.urlNav = url;
        NSLog(@"Calling Application Bundle ID: %@", sourceApplication);
        NSLog(@"URL scheme:%@", [url scheme]);
        NSLog(@"URL query: %@", [url query]);
        NSLog(@"%@",url);
        /////此处根据从后台获得url地址进行处理 获得参数
        /////这个处理函数处理url 的形式      不知道什么原因多了  //
        //////https://地址？参数//
        //////http://地址？参数//
        NSString *reqer = [url.resourceSpecifier substringFromIndex:2];
        
        if ([reqer hasSuffix:@"//"]) {
            reqer = [reqer substringToIndex:reqer.length - 2];
        }
        NSDictionary *dic = [UtilTool parameterWithStringURLParam:reqer];
        NSLog(@"%@",dic);
        //获得当前正在显示也
        UIViewController *currentVC = [UIViewController sq_currentViewController];
        ///pop到根目录 使每次进入到指定页时都是初始化状态
        [currentVC.navigationController popToRootViewControllerAnimated:NO];
        /////////获得当前正在显示的根页显示的当前页
        currentVC = [UIViewController sq_currentViewController];
        if ([dic[@"key"] integerValue] == 1) {
            //////////根据参数跳转到指定页
            UIViewController *vc = [[UIViewController alloc] init];
            [currentVC.navigationController pushViewController:vc animated:YES];
        }
    }
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
