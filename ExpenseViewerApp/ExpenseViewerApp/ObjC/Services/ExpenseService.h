//
//  ExpenseService.h
//  ExpenseViewerApp
//
//  Created by Yogesh Tandulkar on 15/11/25.
//


#import <Foundation/Foundation.h>

@interface ExpenseService : NSObject

+ (void)fetchExpensesWithCompletion:(void (^)(NSArray *items, NSError *error))completion;

@end
