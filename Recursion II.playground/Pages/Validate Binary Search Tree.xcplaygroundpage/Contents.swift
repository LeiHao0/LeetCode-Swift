//: [Previous](@previous)

//Runtime: 48 ms
//Memory Usage: 21.5 MB
//67.41%

class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        return helper(root, Int.min, Int.max)
    }
    
    private func helper(_ node: TreeNode?, _ lower: Int, _ upper: Int) -> Bool {
        guard let n = node else { return true }
        if n.val <= lower || n.val >= upper { return false }
        
        return helper(n.left, lower, n.val) && helper(n.right, n.val, upper)
    }
}


var r = TreeNode(2)
r.left = TreeNode(1)
r.right = TreeNode(3)

let s = Solution()
s.isValidBST(r)

r = TreeNode(2)

//: [Next](@next)
