//
//  CPlusArithmetic.cpp
//  WYTempProject
//
//  Created by maxcwfeng on 2019/12/31.
//  Copyright © 2019 maxcwfeng. All rights reserved.
//

#include <stdio.h>
#include <vector>
#include <string>
#include <queue>
#include <stack>
#include <map>
#include <set>
#include <math.h>
#import <UIKit/UIKit.h>
#include "CPlusArithmetic.h"

//死记硬背一个起始跟结束，起始包括，结束不包括的逻辑
//统计个规律，一般排序都是 if(left >= right) 或者 if(left < right) 是条件，两个其实是一样的
using namespace std;

bool sortAndFind::erfen(std::vector<int>& sourceData, int target)
{
    //前缀条件判断
    if(0 == sourceData.size())
        return false;
    
    if(target < sourceData[0] || target > sourceData[sourceData.size() - 1])
        return false;
    
    //-------------------------------
    unsigned long begin = 0;
    unsigned long end = sourceData.size() - 1;
    while (begin <= end) {
        unsigned long tempIndex = (begin + end) / 2;
        if(target < sourceData[tempIndex])
        {
            end = tempIndex;
            continue;
        }
        
        if(target > sourceData[tempIndex])
        {
            begin = tempIndex + 1;
            continue;
        }
        
        return true;
    }
    
    return false;
}

bool runerfen(unsigned long left, unsigned long right, std::vector<int>& sourceData, int target)
{
    if(left >= right)
        return false;
    
    unsigned long mid = (left + right) / 2;
    if(target == sourceData[mid])
        return true;
    
    if(target < sourceData[mid])
        return runerfen(left, mid, sourceData, target);
    else
        return runerfen(mid + 1, right, sourceData, target);
}

bool sortAndFind::erfenEx(std::vector<int>& sourceData, int target)
{
    //前缀条件判断
    if(0 == sourceData.size())
        return false;
    
    if(target < sourceData[0] || target > sourceData[sourceData.size() - 1])
        return false;
    
    //-------------------------------
    return runerfen(0, sourceData.size(), sourceData, target);
}

void sortAndFind::maopao(int data[], int len)
{
    for(int i = 0; i < len - 1; i++)
    {
        int target = 0;
        for(int y = 0; y < len - i; y++)
        {
            if(data[target] > data[y])
            {
                int temp = data[y];
                data[y] = data[target];
                data[target] = temp;
            }
            
            target = y;
        }
    }
}

//选择下一个往前面已经拍好的数组里面插
void sortAndFind::charu(int data[], int len)
{
    for(int i = 1; i < len; i++)
    {
        int targetValue = data[i];
        for(int y = 0; y < i; y++)
        {
            if(targetValue < data[y])
            {
                int tmep = data[y];
                data[y] = data[i];
                data[i] = tmep;
                 
//                //或者用下面这种方式
//                for(int tempI = i; tempI > y; tempI--)
//                {
//                    data[tempI] = data[tempI-1];
//                }
//
//                data[y] = targetValue;
//                break;
            }
        }
    }
}

//在数据中选择最小小的放在第一位，在剩下的数据选择最小的放第二位，剩下的数据选择最小的放第三位
void sortAndFind::xuanze(int data[], int len)
{
    for(int i = 0; i < len - 1; i++)
    {
        int tempIndex = i;
        for(int y = i + 1; y<len; y++)
        {
            if(data[tempIndex] > data[y])
            {
                tempIndex = y;
            }
        }
        
        if(tempIndex != i)
        {
            int text = data[tempIndex];
            data[tempIndex] = data[i];
            data[i] = text;
        }
    }
}

void sortAndFind::kuaisu(int data[], int len)
{
    stack<int> tempStack;
    tempStack.push(len - 1);
    tempStack.push(0);
    while (NO == tempStack.empty()) {
        int begin = tempStack.top();tempStack.pop();
        int end = tempStack.top();tempStack.pop();

        if(begin >= end)
            continue;
        
        int tempBegin = begin;
        int tempEnd = end;
        int tempValue = data[tempBegin];
        while (tempBegin < tempEnd) {
            
            while (data[tempEnd] > tempValue && tempBegin < tempEnd)
                tempEnd--;
            
            if(tempBegin == tempEnd)
                break;
            
            int swapValue = data[tempEnd];
            data[tempEnd] = data[tempBegin];
            data[tempBegin] = swapValue;
            
            while (data[tempBegin] < tempValue && tempBegin < tempEnd)
                tempBegin++;
            
            if(tempBegin == tempEnd)
                break;
            
            swapValue = data[tempEnd];
            data[tempEnd] = data[tempBegin];
            data[tempBegin] = swapValue;
        }
        
        tempStack.push(end);
        tempStack.push(tempBegin + 1);
        
        tempStack.push(tempBegin);
        tempStack.push(begin);
    }
}

void handleKuaiduEx(int begin, int end, int data[])
{
    int tempBegin = begin;
    int tempEnd = end - 1;
    if(tempBegin >= tempEnd)
        return;
    
    int target = data[tempBegin];
    while(tempBegin < tempEnd)
    {
        while (data[tempEnd] > target && tempEnd > tempBegin)
            tempEnd--;
        
        if(tempBegin == tempEnd)
            break;
        
        while (data[tempBegin] < target && tempEnd > tempBegin)
            tempBegin++;
        
        if(tempBegin == tempEnd)
            break;
        
        int temp = data[tempEnd];
        data[tempEnd] = data[tempBegin];
        data[tempBegin] = temp;
    }
    
    handleKuaiduEx(begin, tempBegin, data);
    handleKuaiduEx(tempBegin + 1, end, data);
}

void sortAndFind::kuaisuEx(int data[], int len)
{
    handleKuaiduEx(0, len, data);
}

binaryTreeNode* sortAndFind::createBinaryTree(int data[], int len)
{
    //有警告，正确的用法是：不在函数内部使用sizeof，记得写代码的时候长度要外面传，不要里面算，有问题。 https://blog.csdn.net/weixin_42631693/article/details/100585782
    //int a = sizeof(data);
    if(NULL == data)
        return NULL;
    
    binaryTreeNode* root = new binaryTreeNode;
    root->leftNode = NULL;
    root->rightNode = NULL;
    root->number = data[0];
    
    for(unsigned int i = 1; i<len; i++)
    {
        _insertNode(root, data[i]);
    }
    
    return root;
}

void sortAndFind::_insertNode(binaryTreeNode*root, int target)
{
    if(NULL == root)
        return;
    
    if(target <= root->number)
    {
        if(root->leftNode)
        {
            _insertNode(root->leftNode, target);
        }
        else
        {
            binaryTreeNode* newNode = new binaryTreeNode;
            newNode->leftNode = NULL;
            newNode->rightNode = NULL;
            newNode->number = target;
            
            root->leftNode = newNode;
        }
        
        return;
    }

    if(root->rightNode)
    {
        _insertNode(root->rightNode, target);
    }
    else
    {
        binaryTreeNode* newNode = new binaryTreeNode;
        newNode->leftNode = NULL;
        newNode->rightNode = NULL;
        newNode->number = target;
        
        root->rightNode = newNode;
    }
}

void sortAndFind::FindNumberFromBinaryTree(binaryTreeNode* root)
{
    if(NULL == root)
        return;
    
    NSLog(@"%d", root->number);
    FindNumberFromBinaryTree(root->leftNode);
    FindNumberFromBinaryTree(root->rightNode);
}

void sortAndFind::xianInOrderIter(binaryTreeNode* root)
{
    if(NULL == root)
        return;
    
    stack<binaryTreeNode*> tmpStack;
    tmpStack.push(root);
    
    while(false == tmpStack.empty())
    {
        binaryTreeNode* node = tmpStack.top();
        tmpStack.pop();
        
        NSLog(@"fengchiwei %d", node->number);
        
        if(node->rightNode)
            tmpStack.push(node->rightNode);
        if(node->leftNode)
            tmpStack.push(node->leftNode);
    }
}

void sortAndFind::houInOrderIter(binaryTreeNode *root)
{
    if(NULL == root)
        return;
    
    stack<binaryTreeNode*> tmpStack;
    tmpStack.push(root);
    
    //先序跟后序非常先，只不过多了一个 output
    stack<binaryTreeNode*> output;
    
    while (!tmpStack.empty()) {
        binaryTreeNode *node = tmpStack.top();
        tmpStack.pop();
        
        output.push(node);
        
        //目标是遍历所以的节点
        if (node->rightNode)
            tmpStack.push(node->rightNode);
        if (node->leftNode)
            tmpStack.push(node->leftNode);
    }
    
    while (!output.empty()) {
        NSLog(@"fengchiwei %d", output.top()->number);
        output.pop();
    }
}

void sortAndFind::zhongInOrderIter(binaryTreeNode *root)
{
    stack<binaryTreeNode*> tmpStack;
    
    while (root || false == tmpStack.empty()) {
        if(root)
        {
            tmpStack.push(root);
            root = root->leftNode;
        }
        else
        {
            binaryTreeNode* node = tmpStack.top();
            tmpStack.pop();
            
            NSLog(@"%d", node->number);
            
            root = node->rightNode;
        }
    }
}

void sortAndFind::guibin(int *data, int len)
{
    if(NULL == data || 0 == len)
        return;
    
    int* dataTmpArr = new int[len];
    handleSore(0, len, data, dataTmpArr);
}

void sortAndFind::handleSore(int left, int right, int* data, int* dataTmpArr)
{
    if(left >= right - 1)
        return;
    
    int mid = (left + right) / 2;
    
    handleSore(left, mid, data, dataTmpArr);
    handleSore(mid, right, data, dataTmpArr);
    
    sortEx(left, right, mid, data, dataTmpArr);
}

void sortAndFind::sortEx(int left, int right, int mid, int* data, int* dataTmpArray)
{
    int i = left;
    int j = mid;
    int tempArryIndex = left;
    for(; i < mid && j < right;)
    {
        if(data[i] < data[j])
        {
            dataTmpArray[tempArryIndex++] = data[i++];
            continue;
        }
        
        dataTmpArray[tempArryIndex++] = data[j++];
    }
    
    //把剩下的合入
    while(i < mid)
    {
        dataTmpArray[tempArryIndex++] = data[i++];
    }
    
    while(j < right)
    {
        dataTmpArray[tempArryIndex++] = data[j++];
    }
    
    i = left;
    for(;i < right; i++)
    {
        data[i] = dataTmpArray[i];
    }
}
