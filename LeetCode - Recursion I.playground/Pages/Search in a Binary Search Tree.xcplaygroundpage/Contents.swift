class Solution {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if let v = root?.val, v == val {
            return root
        }
        if let l = searchBST(root?.left, val) {
            return l
        }
        if let r = searchBST(root?.right, val) {
            return r
        }
        return nil
    }
}


let t = TreeNode(4)
t.left = TreeNode(2)
t.right = TreeNode(7)
t.left?.left = TreeNode(1)
t.left?.right = TreeNode(3)

let s = Solution()
let res = s.searchBST(t, 3)
