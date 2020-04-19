//: [Previous](@previous)

class Solution {
    // 12ms, 49.56%
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        nums = nums.filter({$0 != val})
        return nums.count
    }
    
    // 12ms, 49.56%
    func removeElement0(_ nums: inout [Int], _ val: Int) -> Int {
        nums = nums.filter({$0 != val})
        return nums.count
    }
}

let s = Solution()

var a = [3,2,2,3]
s.removeElement(&a, 3)
a

a = [1]
s.removeElement(&a, 3)
a

a = [0,1,2,2,3,0,4,2]
s.removeElement(&a, 2)
a

//: [Next](@next)
