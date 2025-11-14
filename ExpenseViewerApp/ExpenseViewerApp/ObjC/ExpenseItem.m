//
//  ExpenseItem.m
//  ExpenseViewerApp
//
//  Created by Yogesh Tandulkar on 15/11/25.
//

#import "ExpenseItem.h"

@implementation ExpenseItem

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        _itemId = [dict[@"id"] integerValue];
        _title = dict[@"title"];
        _amount = [dict[@"amount"] floatValue];

        // Convert date string → NSDate
        NSString *dateString = dict[@"date"];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
        _date = [formatter dateFromString:dateString];
    }
    return self;
}

@end
