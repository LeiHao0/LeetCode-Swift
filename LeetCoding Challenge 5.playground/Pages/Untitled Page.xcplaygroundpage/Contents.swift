//: [Previous](@previous)

/**
 # Kth Smallest Element in a BST

 Given a binary search tree, write a function `kthSmallest` to find the **k**th smallest element in it.

 **Note:**
 You may assume k is always valid, 1 ≤ k ≤ BST's total elements.

 **Example 1:**

 ```
 Input: root = [3,1,4,null,2], k = 1
    3
   / \
  1   4
   \
    2
 Output: 1
 ```

 **Example 2:**

 ```
 Input: root = [5,3,6,2,4,null,null,1], k = 3
        5
       / \
      3   6
     / \
    2   4
   /
  1
 Output: 3
 ```

 **Follow up:**
 What if the BST is modified (insert/delete operations) often and you need to find the kth smallest frequently? How would you optimize the kthSmallest routine?

   Hide Hint #1

 Try to utilize the property of a BST.

   Hide Hint #2

 Try in-order traversal. (Credits to @chan13)

   Hide Hint #3

 What if you could modify the BST node's structure?

   Hide Hint #4

 The optimal runtime complexity is O(height of BST).
 */

class Solution {
    // 68ms, 84.18%
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var node = root, stack = [TreeNode](), k = k
        while true {
            while let n = node {
                stack.append(n)
                node = node?.left
            }
            node = stack.popLast()
            k -= 1
            if k == 0 { return node!.val }
            node = node?.right
        }
    }

    // 140ms
//    func kthSmallest0(_ root: TreeNode?, _ k: Int) -> Int {
//        self.k = k
//        helper(root)
//        return v
//    }
//
//    private var k = 0, v = 0
//    private func helper(_ node: TreeNode?) {
//        guard let node = node else { return }
//        if k > 0, let l = node.left { helper(l) }
//        k -= 1
//        if k == 0 { v = node.val }
//        if k > 0, let r = node.right { helper(r) }
//    }
}

//: [Next](@next)
