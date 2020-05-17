//: [Previous](@previous)

class Solution {
    func arrangeWords(_ text: String) -> String {
        let lowerText = (text.prefix(1).lowercased() + text.dropFirst()).split(separator: " ")
        var dict = Dictionary<Int, [String.SubSequence]>()
        lowerText.forEach { s in
            dict[s.count] = (dict[s.count] ?? []) + [s]
        }
        
        let str = dict.keys.sorted().map { k in
            dict[k]!.joined(separator: " ")
        }.joined(separator: " ")
        
        return str.prefix(1).uppercased() + str.dropFirst()
    }
}

let s = Solution()
s.arrangeWords("Leetcode is cool")
s.arrangeWords("Keep calm and code on")
s.arrangeWords("To be or not to be")

//: [Next](@next)
