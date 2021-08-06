//
//  NSDictionary+XHLogHelper.m
//  iFM
//
//  Created by Kooyiktung on 2019/1/15.
//  Copyright © 2019 yitong. All rights reserved.
//

#import "NSDictionary+XHLogHelper.h"

@implementation NSDictionary (XHLogHelper)
#if DEBUG
- (NSString *)descriptionWithLocale:(nullable id)locale{
    
    return [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding];
}
#endif
@end
