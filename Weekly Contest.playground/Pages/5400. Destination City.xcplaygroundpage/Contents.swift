//: [Previous](@previous)

class Solution {
    func destCity(_ paths: [[String]]) -> String {
        var dict = [String: String]()
        paths.forEach { dict[$0[0]] = $0[1] }
        var k = dict.first?.value
        while let p = k {
            k = dict[p]
            if k == nil { return p }
        }
        
        return ""
    }
}

let s = Solution()
s.destCity([["London","New York"],["New York","Lima"],["Lima","Sao Paulo"]])
s.destCity([["B","C"],["D","B"],["C","A"]])


//: [Next](@next)
