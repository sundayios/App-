//
//  UtilTool.m
//  ProjectB
//
//  Created by yunmian on 2019/8/8.
//  Copyright © 2019 James. All rights reserved.
//

#import "UtilTool.h"

@implementation UtilTool


+ (NSDictionary *) parameterWithURL:(NSURL *) url {
    
    NSMutableDictionary *parm = [[NSMutableDictionary alloc]init];
    
    //传入url创建url组件类
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:url.absoluteString];
    
    //回调遍历所有参数，添加入字典
    [urlComponents.queryItems enumerateObjectsUsingBlock:^(NSURLQueryItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [parm setObject:obj.value forKey:obj.name];
    }];
    
    return parm;
}

+ (NSDictionary *)parameterWithStringURLParam:(NSString *)strUrlParam{
    NSArray *arr = [strUrlParam componentsSeparatedByString:@"&"];
    //    NSMutableString *jsonStr = [[NSMutableString alloc]initWithString:@"{"];
    NSMutableDictionary *parmDic = [[NSMutableDictionary alloc] init];
    
    for (int i = 0; i < arr.count; i++) {
        
        NSString *subStr = arr[i];
        
        NSArray *subArr = [subStr componentsSeparatedByString:@"="];
        if(subArr != nil && ![subArr isKindOfClass:[NSNull class]] && subArr.count !=0){
            //执行array不为空时的操作
            if (subArr.count !=2 && [subArr.lastObject isKindOfClass:[NSNull class]]) {
                continue;
            }
            [parmDic setObject:subArr.lastObject forKey:subArr.firstObject];
        }
        
        
    }
    
    return parmDic;
}

@end
