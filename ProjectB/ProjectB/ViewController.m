//
//  ViewController.m
//  ProjectB
//
//  Created by yunmian on 2019/8/7.
//  Copyright © 2019 James. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
//#import "SQBaseViewController.h"
#import "UIViewController+SQRoute.h"
#import "UtilTool.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSURL * url = ((AppDelegate *)[UIApplication sharedApplication].delegate).urlNav;
    if(url){
        //显示一下从A获取的url，url = projectB://openBSecondPage,host = openBSecondPage
        self.label.text = [NSString stringWithFormat:@"url = %@,host = %@",[url absoluteString],[url host]];
        //根据传过来的url的host进行一些操作
//        if ([[url host] isEqualToString:@"openBSecondPage"]) {
//            //跳转到第二个界面
//            [self performSegueWithIdentifier:@"second" sender:nil];
//        }
        
        NSURL * url = ((AppDelegate *)[UIApplication sharedApplication].delegate).urlNav;
        if (url) {
            [[UIApplication sharedApplication] openURL:url];
        }
        url = nil;
    }
    
}


@end
