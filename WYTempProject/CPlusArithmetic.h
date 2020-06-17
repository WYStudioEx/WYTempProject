//
//  CPlusArithmetic.h
//  WYTempProject
//
//  Created by maxcwfeng on 2019/12/31.
//  Copyright © 2019 maxcwfeng. All rights reserved.
//

#ifndef CPlusArithmetic_h
#define CPlusArithmetic_h

#include <vector>


struct binaryTreeNode
{
    int number;
    binaryTreeNode* leftNode;
    binaryTreeNode* rightNode;
};

class sortAndFind
{
public:
    //排序都是从小到大
    bool erfen(std::vector<int>& sourceData, int target);
    bool erfenEx(std::vector<int>& sourceData, int target);
    
    void maopao(int data[], int len);
    
    void charu(int data[], int len);
    
    void xuanze(int data[], int len);
    
    void kuaisu(int data[], int len);
    void kuaisuEx(int data[], int len);
    
    void guibin(int data[], int len);
    
    binaryTreeNode* createBinaryTree(int data[], int len);
    void FindNumberFromBinaryTree(binaryTreeNode* root);
    
    //二叉树遍历
    void xianInOrderIter(binaryTreeNode* root);
    void zhongInOrderIter(binaryTreeNode *root);
    void houInOrderIter(binaryTreeNode *root);
    
protected:
    void _insertNode(binaryTreeNode*root, int target);
    
    //归并用的
    void handleSore(int left, int right, int* data, int* dataTmpArr);
    void sortEx(int left, int right, int mid, int* data, int* dataTmpArray);
};

#endif /* CPlusArithmetic_h */
