//: [Previous](@previous)

import Foundation

class Solution {
    func maxVowels(_ s: String, _ k: Int) -> Int {
        if k > s.count { return 0 }
        let vowels = Set("aeiou"), s = Array(s)
        var ans = 0
        for i in 0...(s.count-k) {
            let v = s[i..<i+k].reduce(0) { $0 + (vowels.contains($1) ? 1 : 0) }
            ans = max(ans, v)
            if ans == k { break }
        }
        return ans
    }
}

let s = Solution()
s.maxVowels("abciiidef", 3)
s.maxVowels("aeiou", 2)
s.maxVowels("leetcode", 3)
s.maxVowels("rhythms", 4)
s.maxVowels("tryhard", 4)

//: [Next](@next)
