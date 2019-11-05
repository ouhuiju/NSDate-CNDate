//
//  NSDate+CNDate.m
//  MCA
//
//  Created by 区慧驹 on 2019/11/5.
//  Copyright © 2019 OAKR OU. All rights reserved.
//

#import "NSDate+CNDate.h"

@implementation NSDate (CNDate)

+ (NSString *)transferTotoCNDateStrByDate:(NSDate *)date {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:@"yyyy"];
    NSInteger currentYear=[[formatter stringFromDate:date] integerValue];
    [formatter setDateFormat:@"MM"];
    NSInteger currentMonth=[[formatter stringFromDate:date]integerValue];
    [formatter setDateFormat:@"dd"];
    NSInteger currentDay=[[formatter stringFromDate:date] integerValue];
    
    NSString *currentYearStr = [NSString stringWithFormat:@"%ld", (long)currentYear];
    
    NSMutableArray *currentYearSep = [NSMutableArray new];
    for (int i = 0; i < currentYearStr.length; i++) {
        NSString *c = [currentYearStr substringWithRange:NSMakeRange(i,1)];
        [currentYearSep addObject:c];
    }
    NSMutableArray *currentYearCNSep = [NSMutableArray new];
    [currentYearSep enumerateObjectsUsingBlock:^(NSString *num, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([[self numToCNText:[num integerValue]] isEqualToString:@"〇"]) {
            [currentYearCNSep addObject:@"零"];
        } else {
            [currentYearCNSep addObject:[self numToCNText:[num integerValue]]];
        }
    }];
    
    NSString *result = [NSString stringWithFormat:@"%@年%@月%@日",[currentYearCNSep componentsJoinedByString:@""],[self numToCNText:currentMonth],[self numToCNText:currentDay]];
    
//    NSLog(@"%@", result);
    
    return result;
}

+ (NSString *)numToCNText:(NSInteger)num {
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    
    formatter.numberStyle = kCFNumberFormatterSpellOutStyle;
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    
    NSString *string = [formatter stringFromNumber:[NSNumber numberWithInteger: num]];
    
    return string;
}

@end
