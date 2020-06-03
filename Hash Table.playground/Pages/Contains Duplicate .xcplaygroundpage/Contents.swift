//: [Previous](@previous)

class Solution {
    // 160ms, 52.84%
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var set = Set<Int>()
        for i in nums {
            if set.contains(i) {
                return true
            }
            set.insert(i)
        }
        return false
    }
}

//: [Next](@next)
