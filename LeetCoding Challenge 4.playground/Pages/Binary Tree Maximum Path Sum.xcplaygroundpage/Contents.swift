//: [Previous](@previous)

/**
 # Binary Tree Maximum Path Sum

 Given a **non-empty** binary tree, find the maximum path sum.

 For this problem, a path is defined as any sequence of nodes from some starting node to any node in the tree along the parent-child connections. The path must contain **at least one node** and does not need to go through the root.

 **Example 1:**

 ```
 Input: [1,2,3]

        1
       / \
      2   3

 Output: 6
 ```

 **Example 2:**

 ```
 Input: [-10,9,20,null,null,15,7]

    -10
    / \
   9  20
     /  \
    15   7

 Output: 42
 ```
 */

class Solution {
    private var vMax = Int.min
    private func helper(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        let l = max(helper(root.left), 0)
        let r = max(helper(root.right), 0)
        
        vMax = max(vMax, root.val + l + r)
        return root.val + max(l, r)
    }
    
    func maxPathSum(_ root: TreeNode?) -> Int {
        helper(root)
        return vMax
    }
}

//: [Next](@next)
