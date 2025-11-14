//
//  ExpenseItem.h
//  ExpenseViewerApp
//
//  Created by Yogesh Tandulkar on 15/11/25.
//


#import <Foundation/Foundation.h>

@interface ExpenseItem : NSObject

@property (nonatomic, assign) NSInteger itemId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) float amount;
@property (nonatomic, strong) NSDate *date;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
