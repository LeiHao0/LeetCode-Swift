//: [Previous](@previous)

class Solution {
    func maxPower(_ s: String) -> Int {
        if s.isEmpty { return 0 }
        var lv = 1, gv = 1
        let cs = Array(s)
        for i in 1..<cs.count {
            if cs[i] == cs[i-1] {
                lv += 1
                gv = max(gv, lv)
            } else {
                lv = 1
            }
        }
        return gv
    }
}

let s = Solution()
s.maxPower("")
s.maxPower("l")
s.maxPower("leetcode") // 2
s.maxPower("abbcccddddeeeeedcba") // 5
s.maxPower("triplepillooooow") // 5
s.maxPower("hooraaaaaaaaaaay") // 11
s.maxPower("tourist") // 1


//: [Next](@next)
