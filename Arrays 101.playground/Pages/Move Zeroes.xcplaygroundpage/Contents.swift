//: [Previous](@previous)

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        nums = Array(nums.split(separator: 0).joined()) + Array(nums.filter { $0 == 0 })
    }
}

//: [Next](@next)
