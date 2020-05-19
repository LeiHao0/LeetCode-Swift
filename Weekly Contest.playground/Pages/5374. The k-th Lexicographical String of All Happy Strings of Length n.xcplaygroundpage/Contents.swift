//: [Previous](@previous)

// TODO:

import Foundation

class Solution {
    func getHappyString(_ n: Int, _ k: Int) -> String {
        let i = (0 ..< n - 1).reduce(1) { v, _ in v * 2 }
        if k > 3 * i { return "" }

        return "c"
    }
}

let s = Solution()
s.getHappyString(1, 3) // c

s.getHappyString(1, 4) // ""
s.getHappyString(2, 7) // ""

//: [Next](@next)
