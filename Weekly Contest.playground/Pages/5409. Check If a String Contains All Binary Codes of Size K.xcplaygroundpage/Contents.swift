//: [Previous](@previous)

import Foundation

class Solution {
    func hasAllCodes(_ s: String, _ k: Int) -> Bool {
        let strs = (1..<k).reduce(["1", "0"]) { (v, _) in
            v.map({ $0 + "0" }) + v.map({ $0 + "1" })
        }
        for str in strs {
            if !s.contains(str) {
                return false
            }
        }
        return true
    }
}

let s = Solution()
s.hasAllCodes("11", 3)


//: [Next](@next)
