//: [Previous](@previous)

//61.54%
//Runtime: 36 ms
//Memory Usage: 22.2 MB

class Solution {
    func generateTrees(_ n: Int) -> [TreeNode?] {
        if n < 1 { return [] }
        return helper(1, n)
    }
    
    private func helper(_ i1: Int, _ i2:Int) -> [TreeNode?] {
        if i1 > i2 { return [nil] }

        var tn = [TreeNode]()
        for i in i1...i2 {
            let l = helper(i1, i-1)
            let r = helper(i+1, i2)
            
            for li in l {
                for ri in r {
                    let n = TreeNode(i)
                    n.left = li
                    n.right = ri
                    tn.append(n)
                }
            }
        }
        
        return tn
    }
}

let s = Solution()

for i in -3..<3 {
    print(i, s.generateTrees(i))
}


//: [Next](@next)
