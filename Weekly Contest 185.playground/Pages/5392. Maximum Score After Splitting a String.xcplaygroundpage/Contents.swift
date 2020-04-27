//: [Previous](@previous)

/**
 
 */

class Solution {
    func maxScore(_ s: String) -> Int {
        var l0 = 0, gv = 0,  r1 = s.filter({$0 == "1"}).count
        let sa = Array(s)
       
        sa[0] == "0" ? (l0 += 1) : (r1 -= 1)
        gv = max(gv, l0 + r1)
        for i in 1..<sa.count-1 {
            sa[i] == "0" ? (l0 += 1) : (r1 -= 1)
            gv = max(gv, l0 + r1)
        }
        
        return gv
    }
}

let s = Solution()

s.maxScore("011101")
s.maxScore("00111")
s.maxScore("1111")
s.maxScore("00")
s.maxScore("000")
s.maxScore("11")
s.maxScore("111")
s.maxScore("01")
s.maxScore("10")
s.maxScore("110")


//: [Next](@next)
