//: [Previous](@previous)

/**
 # Cousins in Binary Tree

 In a binary tree, the root node is at depth `0`, and children of each depth `k` node are at depth `k+1`.

 Two nodes of a binary tree are *cousins* if they have the same depth, but have **different parents**.

 We are given the `root` of a binary tree with unique values, and the values `x` and `y` of two different nodes in the tree.

 Return `true` if and only if the nodes corresponding to the values `x` and `y` are cousins.

  

 **Example 1:
 ![img](https://assets.leetcode.com/uploads/2019/02/12/q1248-01.png)**

 ```
 Input: root = [1,2,3,4], x = 4, y = 3
 Output: false
 ```

 **Example 2:
 ![img](https://assets.leetcode.com/uploads/2019/02/12/q1248-02.png)**

 ```
 Input: root = [1,2,3,null,4,null,5], x = 5, y = 4
 Output: true
 ```

 **Example 3:**

 **![img](https://assets.leetcode.com/uploads/2019/02/13/q1248-03.png)**

 ```
 Input: root = [1,2,3,null,4], x = 2, y = 3
 Output: false
 ```

  

 **Note:**

 1. The number of nodes in the tree will be between `2` and `100`.
 2. Each node has a unique integer value from `1` to `100`.

  
 */

class Solution {
    private var xv = (0, 0), yv = (0, 0)
    
    // 8ms, 96.49%
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        helper(root, 0, x, y)
        
        return xv.0 == yv.0 && xv.1 != yv.1
    }
    
    private func helper(_ node: TreeNode?, _ level: Int, _ x: Int, _ y: Int) {
        guard let node = node else { return }
        let l = level+1
        if let n = node.left {
            if n.val == x {
                xv = (l, node.val)
            } else if n.val == y {
                yv = (l, node.val)
            }
        }
        if let n = node.right {
            if n.val == x {
                xv = (l, node.val)
            } else if n.val == y {
                yv = (l, node.val)
            }
        }
        
        helper(node.left, l, x, y)
        
        helper(node.right, l, x, y)
    }
    
}

//: [Next](@next)
