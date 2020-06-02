//: [Previous](@previous)

import Foundation

class Solution {
    func hasAllCodes(_ s: String, _ k: Int) -> Bool {
        if s.count <= k { return false }
        let s = Array(s)
        var set = Set<String>()
        for i in 0 ... (s.count - k) {
            set.insert(String(s[i ..< i + k]))
        }
        return set.count == (2 << (k - 1))
    }
}

let s = Solution()
s.hasAllCodes("00110110", 2)
s.hasAllCodes("0101", 13)

//: [Next](@next)
