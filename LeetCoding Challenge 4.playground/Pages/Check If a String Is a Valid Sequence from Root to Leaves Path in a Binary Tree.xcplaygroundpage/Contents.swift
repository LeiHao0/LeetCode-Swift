//: [Previous](@previous)

/**
 # Check If a String Is a Valid Sequence from Root to Leaves Path in a Binary Tree

 Given a binary tree where each path going from the root to any leaf form a **valid sequence**, check if a given string is a **valid sequence** in such binary tree.

 We get the given string from the concatenation of an array of integers `arr` and the concatenation of all values of the nodes along a path results in a **sequence** in the given binary tree.

  

 **Example 1:**

 **![img](https://assets.leetcode.com/uploads/2019/12/18/leetcode_testcase_1.png)**

 ```
 Input: root = [0,1,0,0,1,0,null,null,1,0,0], arr = [0,1,0,1]
 Output: true
 Explanation:
 The path 0 -> 1 -> 0 -> 1 is a valid sequence (green color in the figure).
 Other valid sequences are:
 0 -> 1 -> 1 -> 0
 0 -> 0 -> 0
 ```

 **Example 2:**

 **![img](https://assets.leetcode.com/uploads/2019/12/18/leetcode_testcase_2.png)**

 ```
 Input: root = [0,1,0,0,1,0,null,null,1,0,0], arr = [0,0,1]
 Output: false
 Explanation: The path 0 -> 0 -> 1 does not exist, therefore it is not even a sequence.
 ```

 **Example 3:**

 **![img](https://assets.leetcode.com/uploads/2019/12/18/leetcode_testcase_3.png)**

 ```
 Input: root = [0,1,0,0,1,0,null,null,1,0,0], arr = [0,1,1]
 Output: false
 Explanation: The path 0 -> 1 -> 1 is a sequence, but it is not a valid sequence.
 ```

  

 **Constraints:**

 - `1 <= arr.length <= 5000`
 - `0 <= arr[i] <= 9`
 - Each node's value is between [0 - 9].

   Hide Hint #1

 Depth-first search (DFS) with the parameters: current node in the binary tree and current position in the array of integers.

   Hide Hint #2

 When reaching at final position check if it is a leaf node.
 */

class Solution {
    // 204ms
    func isValidSequence(_ root: TreeNode?, _ arr: [Int]) -> Bool {
        guard let root = root, let v = arr.first else { return false }
        
        if root.val == v {
            if arr.count == 1 && root.left == nil && root.right == nil { return true }
            let subArr = Array(arr[1...])
            return isValidSequence(root.left, subArr) || isValidSequence(root.right, subArr)
        } else {
            return false
        }
    }
}

let t = TreeNode(8)
t.left = TreeNode(3)

let s = Solution()
s.isValidSequence(t, [8])

//: [Next](@next)

