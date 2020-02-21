//Runtime: 176 ms
//Memory Usage: 21 MB

class Solution {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return nil }
        if root.val == val { return root }
        if val < root.val {
            return searchBST(root.left, val)
        } else {
            return searchBST(root.right, val)
        }
    }
}


let t = TreeNode(4)
t.left = TreeNode(2)
t.right = TreeNode(7)
t.left?.left = TreeNode(1)
t.left?.right = TreeNode(3)

let s = Solution()

print(s.searchBST(t, 3)?.val)
print(s.searchBST(t, 1)?.val)
print(s.searchBST(t, 5)?.val)
