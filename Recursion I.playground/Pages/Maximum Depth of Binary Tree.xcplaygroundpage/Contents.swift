//: [Previous](@previous)

// Runtime: 32 ms
// Memory Usage: 21.5 MB
// beats 66.59%

class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard root != nil else { return 0 }
        return 1 + max(maxDepth(root?.left), maxDepth(root?.right))
    }
}

let t = TreeNode(3)
t.left = TreeNode(9)
t.right = TreeNode(20)
t.right?.left = TreeNode(15)
t.right?.right = TreeNode(7)

let s = Solution()
s.maxDepth(t)
s.maxDepth(nil)
s.maxDepth(TreeNode(6))

//: [Next](@next)
