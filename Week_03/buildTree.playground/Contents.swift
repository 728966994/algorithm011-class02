import UIKit

// 105. 从前序与中序遍历序列构造二叉树

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    let preLen = preorder.count;
    let inLen = inorder.count;
    if preLen != inLen {
        return nil;
    }
    
    var dict: [Int:Int] = [:];
    for (index, num) in inorder.enumerated(){
        dict[num] = index;
    }
    
    return buildTree(preorder, 0, preLen - 1, dict, 0, inLen - 1);
}

func buildTree(_ preorder: [Int], _ preLeft: Int, _ preRight: Int, _ dict: [Int:Int], _ inLeft: Int, _ inRight: Int) -> TreeNode? {
    if preLeft > preRight || inLeft > inRight {
        return nil;
    }
    
    let rootValue: Int = preorder[preLeft];
    let root: TreeNode = TreeNode.init(rootValue);
    let pIndex: Int = dict[rootValue]!;
    
    root.left = buildTree(preorder, preLeft + 1, pIndex - inLeft + preLeft, dict, inLeft, pIndex - 1);
    root.right = buildTree(preorder, pIndex - inLeft + preLeft + 1,  preRight, dict, pIndex + 1, inRight)
    
    return root;
}
