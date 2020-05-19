//: [Previous](@previous)

class Solution {
    // 72ms, 90.5%
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

    // 100ms, 15.47%
    func removeDuplicates0(_ nums: inout [Int]) -> Int {
        nums = Set(nums).sorted()
        return nums.count
    }
}

let s = Solution()

var a = [1, 1, 2]
s.removeDuplicates(&a)
a

a = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4]
s.removeDuplicates(&a)
a

a = []
s.removeDuplicates(&a)
a

a = [1]
s.removeDuplicates(&a)
a

//: [Next](@next)
