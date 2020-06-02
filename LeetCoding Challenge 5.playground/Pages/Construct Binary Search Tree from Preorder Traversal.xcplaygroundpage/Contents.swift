//: [Previous](@previous)

/**
 # Construct Binary Search Tree from Preorder Traversal

 Return the root node of a binary **search** tree that matches the given `preorder` traversal.

 *(Recall that a binary search tree is a binary tree where for every node, any descendant of `node.left` has a value `<` `node.val`, and any descendant of `node.right` has a value `>` `node.val`. Also recall that a preorder traversal displays the value of the `node` first, then traverses `node.left`, then traverses `node.right`.)*

 It's guaranteed that for the given test cases there is always possible to find a binary search tree with the given requirements.

 **Example 1:**

 ```
 Input: [8,5,1,7,10,12]
 Output: [8,5,10,1,7,null,12]
 ```

 **Constraints:**

 - `1 <= preorder.length <= 100`
 - `1 <= preorder[i] <= 10^8`
 - The values of `preorder` are distinct.
 */

class Solution {
    // 12ms, 66.93%
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        guard let v = preorder.first else { return nil }

        let root = TreeNode(v)
        if let i = preorder.firstIndex(where: { $0 > v }) {
            root.left = bstFromPreorder(Array(preorder[1 ..< i]))
            root.right = bstFromPreorder(Array(preorder[i...]))
        } else {
            root.left = bstFromPreorder(Array(preorder[1...]))
        }
        return root
    }

    // 12ms, 66.93%
    func bstFromPreorder1(_ preorder: [Int]) -> TreeNode? {
        guard let v = preorder.first else { return nil }

        let root = TreeNode(v)
        var i = 1, j = preorder.count - 1
        while i <= j {
            let m = i + (j - i) / 2
            preorder[m] < v ? (i = m + 1) : (j = m - 1)
        }
        if i >= 1 {
            root.left = bstFromPreorder(Array(preorder[1 ..< i]))
            root.right = bstFromPreorder(Array(preorder[i...]))
        } else {
            root.left = bstFromPreorder(Array(preorder[1...]))
        }
        return root
    }

    // 12ms, 66.93%
    func bstFromPreorder0(_ preorder: [Int]) -> TreeNode? {
        guard let v = preorder.first else { return nil }

        let root = TreeNode(v)
        if let i = preorder.firstIndex(where: { $0 > v }) {
            root.left = bstFromPreorder(Array(preorder[1 ..< i]))
            root.right = bstFromPreorder(Array(preorder[i...]))
        } else {
            root.left = bstFromPreorder(Array(preorder[1...]))
        }
        return root
    }
}

//: [Next](@next)
