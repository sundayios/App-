//
//  ViewController.m
//  ProjectA
//
//  Created by yunmian on 2019/8/7.
//  Copyright © 2019 James. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)click:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"projectB://host=5&parameter=3"]];
}

@end
