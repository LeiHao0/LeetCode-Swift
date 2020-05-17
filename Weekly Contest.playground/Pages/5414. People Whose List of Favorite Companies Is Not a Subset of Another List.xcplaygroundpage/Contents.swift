//: [Previous](@previous)

class Solution {
    func peopleIndexes(_ favoriteCompanies: [[String]]) -> [Int] {
        let sets = favoriteCompanies.map { Set($0) }
        var ans = [Int]()
        for (i, set) in sets.enumerated() {
            var newSets = sets
            newSets.remove(at: i)
            var b = false
            for ns in newSets {
                if set.isSubset(of: ns) {
                    b = true
                    break
                }
            }
            if !b { ans.append(i) }
        }
        return ans
    }
}

let s = Solution()
s.peopleIndexes([["leetcode","google","facebook"],["google","microsoft"],["google","facebook"],["google"],["amazon"]])
s.peopleIndexes([["leetcode","google","facebook"],["leetcode","amazon"],["facebook","google"]])
s.peopleIndexes([["leetcode"],["google"],["facebook"],["amazon"]])

//: [Next](@next)
