//
//  Stack.m
//  WYTempProject
//
//  Created by maxcwfeng on 2019/12/31.
//  Copyright © 2019 maxcwfeng. All rights reserved.
//

#import "Stack.h"

@interface Stack()

@property(nonatomic, strong) NSMutableArray* stackArray;

@end

//----------------------------------------------------
@implementation Stack

- (instancetype)init
{
    if([super init])
    {
        _stackArray = [NSMutableArray arrayWithCapacity:10];
    }
    
    return self;
}


- (void)push:(NSUInteger) number
{
    [_stackArray addObject:@(number)];
}

- (NSInteger)pop
{
    NSInteger topNumber = [[_stackArray objectAtIndex:_stackArray.count - 1] unsignedIntegerValue];
    [_stackArray removeLastObject];
    
    return topNumber;
}

@end
