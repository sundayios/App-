//
//  UtilTool.h
//  ProjectB
//
//  Created by yunmian on 2019/8/8.
//  Copyright © 2019 James. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UtilTool : NSObject


+ (NSDictionary *) parameterWithURL:(NSURL *) url;

+ (NSDictionary *)parameterWithStringURLParam:(NSString *)strUrlParam;
@end

NS_ASSUME_NONNULL_END
