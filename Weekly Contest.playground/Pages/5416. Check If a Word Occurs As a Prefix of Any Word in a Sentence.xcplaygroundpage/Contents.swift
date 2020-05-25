//: [Previous](@previous)

import Foundation

class Solution {
    func isPrefixOfWord(_ sentence: String, _ searchWord: String) -> Int {
        let arr = sentence.split(separator: " ")
        if let i = arr.firstIndex(where: { $0.hasPrefix(searchWord) }) {
            return i+1
        } else {
            return -1
        }
    }
}

let s = Solution()
s.isPrefixOfWord("i love eating burger", "burg")

//: [Next](@next)
