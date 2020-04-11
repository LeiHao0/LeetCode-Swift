//: [Previous](@previous)

/**
 # Diameter of Binary Tree

 Given a binary tree, you need to compute the length of the diameter of  the tree. The diameter of a binary tree is the length of the **longest** path between any two nodes in a tree. This path may or may not pass through the root.

 **Example:**
  Given a binary tree

 ```
           1
          / \
         2   3
        / \
       4   5
 ```

 

 Return **3**, which is the length of the path [4,2,1,3] or [5,2,1,3].

 **Note:** The length of path between two nodes is represented by the number of edges between them.
 */


class Solution {
    //    Runtime: 28 ms, 93.83%
    //    Memory Usage: 22 MB
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        return helper(root).1
    }
    
    private func helper(_ root: TreeNode?) -> (Int, Int) {
        var lv = (0, 0), rv = (0, 0)
        if let l = root?.left {
            lv = helper(l)
            lv.0 += 1
        }
        if let r = root?.right {
            rv = helper(r)
            rv.0 += 1
        }
        
        return (max(lv.0, rv.0), max(lv.0+rv.0, lv.1, rv.1))
    }
}

let t = TreeNode(1)
t.left = TreeNode(2)
t.left?.left = TreeNode(4)
t.left?.right = TreeNode(5)
t.right = TreeNode(3)

let s = Solution()
s.diameterOfBinaryTree(t)

//[1,2,3,4,5]
//[4,-7,-3,null,null,-9,-3,9,-7,-4,null,6,null,-6,-6,null,null,0,6,5,null,9,null,null,-1,-4,null,null,null,-2]


//: [Next](@next)
