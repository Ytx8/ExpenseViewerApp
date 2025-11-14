//
//  ExpenseService.m
//  ExpenseViewerApp
//
//  Created by Yogesh Tandulkar on 15/11/25.
//
#import "ExpenseService.h"
#import "ExpenseItem.h"

@implementation ExpenseService

+ (void)fetchExpensesWithCompletion:(void (^)(NSArray *items, NSError *error))completion {

    NSURL *url = [NSURL URLWithString:@"https://www.jsonkeeper.com/b/DYZJF"];

    NSURLSessionDataTask *task =
    [[NSURLSession sharedSession] dataTaskWithURL:url
                                completionHandler:^(NSData *data,
                                                    NSURLResponse *response,
                                                    NSError *error) {

        if (error) {
            completion(nil, error);
            return;
        }

        NSError *jsonError;
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data
                                                              options:0
                                                                error:&jsonError];

        if (jsonError) {
            completion(nil, jsonError);
            return;
        }

        // Transform JSON → model objects
        NSMutableArray *items = [NSMutableArray array];
        for (NSDictionary *dict in jsonArray) {
            ExpenseItem *item = [[ExpenseItem alloc] initWithDictionary:dict];
            [items addObject:item];
        }

        completion(items, nil);
    }];

    [task resume];
}

@end
