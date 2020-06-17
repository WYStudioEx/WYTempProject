//
//  Stack.h
//  WYTempProject
//
//  Created by maxcwfeng on 2019/12/31.
//  Copyright © 2019 maxcwfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Stack : NSObject

- (void)push:(NSUInteger) number;

- (NSInteger)pop;

@end

NS_ASSUME_NONNULL_END
