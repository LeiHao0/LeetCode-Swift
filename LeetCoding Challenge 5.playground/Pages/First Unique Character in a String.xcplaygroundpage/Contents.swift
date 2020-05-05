//: [Previous](@previous)

/**
 # First Unique Character in a String

 Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.

 **Examples:**

 ```
 s = "leetcode"
 return 0.

 s = "loveleetcode",
 return 2.
 ```



 **Note:** You may assume the string contain only lowercase letters.
 */

class Solution {
    // 256ms, 69.7%
    func firstUniqChar(_ s: String) -> Int {
        var dict = Dictionary<Character, Int>(), i = 0
        for c in s {
            dict[c] = ((dict[c] ?? 0) + 1)
        }
        for c in s {
            if dict[c] == 1 { return i }
            i += 1
        }
        return -1
    }
    
    // 312ms, 50.4%
    func firstUniqChar0(_ s: String) -> Int {
        var dict = Dictionary<Character, Int>()
        for c in s {
            dict[c] = ((dict[c] ?? 0) + 1)
        }
        for (i, c) in s.enumerated() {
            if dict[c] == 1 { return i }
        }
        return -1
    }
}

//: [Next](@next)
