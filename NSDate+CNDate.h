//
//  NSDate+CNDate.h
//  MCA
//
//  Created by 区慧驹 on 2019/11/5.
//  Copyright © 2019 OAKR OU. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*
* 用于将日期转换为中文日期
*/
@interface NSDate (CNDate)

+ (NSString *)transferTotoCNDateStrByDate:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END
