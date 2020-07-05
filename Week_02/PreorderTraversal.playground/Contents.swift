import UIKit

// 144. 二叉树的前序遍历

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

func preorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    
    var result: [Int] = []
    result.append(root.val)
    result += preorderTraversal(root.left)
    result += preorderTraversal(root.right)
    
    return result
}
