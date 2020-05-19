//: [Previous](@previous)

/**
 # Ransom Note

 Given an arbitrary ransom note string and another string containing letters from all the magazines, write a function that will return true if the ransom note can be constructed from the magazines ; otherwise, it will return false.

 Each letter in the magazine string can only be used once in your ransom note.

 **Note:**
 You may assume that both strings contain only lowercase letters.

 ```
 canConstruct("a", "b") -> false
 canConstruct("aa", "ab") -> false
 canConstruct("aa", "aab") -> true
 ```
 */

import Foundation

class Solution {
    // 104ms, 62.12%
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var dict = [Character: Int]()
        for c in magazine { dict[c] = ((dict[c] ?? 0) + 1) }
        for c in ransomNote { dict[c] = ((dict[c] ?? 0) - 1); if dict[c]! < 0 { return false } }
        return true
    }

    func canConstruct0(_ ransomNote: String, _ magazine: String) -> Bool {
        var dictR = [Character: Int](), dictM = [Character: Int]()
        for c in ransomNote { dictR[c] = ((dictR[c] ?? 0) + 1) }
        for c in magazine { dictM[c] = ((dictM[c] ?? 0) + 1) }
        for (k, v) in dictR {
            if (dictM[k] ?? 0) < v { return false }
        }
        return true
    }
}

let s = Solution()
s.canConstruct("", "")
s.canConstruct("", "a")

s.canConstruct("bbbb", "aaaaabbb")

s.canConstruct("a", "a")

s.canConstruct("fffbfg", "effjfggbffjdgbjjhhdegh")

s.canConstruct("bjaajgea", "affhiiicabhbdchbidghccijjbfjfhjeddgggbajhidhjchiedhdibgeaecffbbbefiabjdhggihccec")

//: [Next](@next)
