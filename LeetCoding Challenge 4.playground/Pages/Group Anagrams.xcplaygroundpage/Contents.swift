//: [Previous](@previous)

class Solution {
    //    Runtime: 192 ms, faster than 90.31%
    //    Memory Usage: 24 MB, less than 33.33%
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict = [String: [String]]()
        strs.forEach {
            let s = String($0.sorted())
            dict[s] = (dict[s] == nil) ? [$0] : dict[s]! + [$0]
        }
        return dict.map { $0.value }
    }

    //    Runtime: 196 ms
    //    Memory Usage: 24.1 MB
    //    82.39%
    func groupAnagrams1(_ strs: [String]) -> [[String]] {
        var dict = [String: [String]]()
        zip(strs.map { String($0.sorted()) }, strs).forEach { k, v in
            dict[k] == nil ? dict[k] = [v] : dict[k]!.append(v)
        }
        return Array(dict.values)
    }
}

let s = Solution()
s.groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"])

//: [Next](@next)
