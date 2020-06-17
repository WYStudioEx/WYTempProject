//
//  ViewController.m
//  WYTempProject
//
//  Created by maxcwfeng on 2019/12/31.
//  Copyright © 2019 maxcwfeng. All rights reserved.
//

#import "ViewController.h"
#include <vector>
#include <string>
using namespace std;

struct ListNode
{
    int number;
    ListNode* next;
};

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
//
//    输入两个字符串，输出一个字符串，输入的字符串都是整数类型，位数很大，把这个字符串相乘的结果输出，即大数相乘的算法，不允许使用系统函数，只使用基本的循环与加减乘除即可。
//例如样本“123456789111111”*“987654321111111，，45分钟左右，需要结果调试输出正确才行
    
    
    string value = run("123456789111111", "987654321111111", 15, 15);
    NSLog(@"");
    
    
//    1234
//
//    *
//
//
//    1234
    
//    1234 * 1
//
//    1234 * 3
//
//    1234 * 41
//
//    12
}

string run(char strOne[], char strTwo[], int lengthOne, int lengthTwo)
{
    if(nil == strOne || nil == strTwo)
        return "0";
    
    unsigned long long valueOne = 0;
    unsigned long long valueTwo = 0;
    
    for(int i = 0; i<lengthOne; i++)
    {
        unsigned long long base = 1;
        int tempIndex = lengthOne - i;
        while (--tempIndex) {
            base *= 10;
        }
        int tempValue = strOne[i] - '0';
        valueOne += (tempValue * base);
    }
    
    for(int i = 0; i<lengthTwo; i++)
    {
        unsigned long long base = 1;
        int tempIndex = lengthTwo - i;
        while (--tempIndex) {
            base *= 10;
        }
        int tempValue = strTwo[i] - '0';
        valueTwo += (tempValue * base);
    }

    unsigned long long targetValue = valueOne * valueTwo;
    string returenValue("");
    unsigned long long base = 10;
    while (true) {
        int64_t a = targetValue % base;
        targetValue = targetValue / base;
        
        char temp = '0' + a;
        string tempString("");
        tempString = temp;
        
        returenValue = tempString.append(returenValue);
        if(0 == targetValue)
            break;
    }
    
    return returenValue;
}

@end
