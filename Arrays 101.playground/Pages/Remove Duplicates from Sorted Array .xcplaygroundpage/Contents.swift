//: [Previous](@previous)

class Solution {
    // 60ms, 100%
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var i = 0
        for j in 0 ..< nums.count {
            if nums[i] != nums[j] {
                i += 1
                nums[i] = nums[j]
            }
        }
        return nums.isEmpty ? 0 : i + 1
    }
}

//: [Next](@next)
