//: [Previous](@previous)

/**
 # Invert Binary Tree

 Solution

 Invert a binary tree.

 **Example:**

 Input:

 ```
      4
    /   \
   2     7
  / \   / \
 1   3 6   9
 ```

 Output:

 ```
      4
    /   \
   7     2
  / \   / \
 9   6 3   1
 ```

 **Trivia:**
 This problem was inspired by [this original tweet](https://twitter.com/mxcl/status/608682016205344768) by [Max Howell](https://twitter.com/mxcl):

 > Google: 90% of our engineers use the software you wrote (Homebrew), but you can’t invert a binary tree on a whiteboard so f*** off.
 */

class Solution {
    // 4ms, 95.72%
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        invertTree(root.left)
        invertTree(root.right)
        let t = root.left
        root.left = root.right
        root.right = t

        return root
    }
}

//: [Next](@next)
