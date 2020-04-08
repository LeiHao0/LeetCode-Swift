//: [Previous](@previous)

class Solution {
    //    Runtime: 40 ms
    //    Memory Usage: 21.9 MB
    //    85.65
    func moveZeroes(_ nums: inout [Int]) {
        nums = Array(nums.split(separator: 0).joined()) + Array(nums.filter({$0 == 0}))
    }
}

let s = Solution()

var a = [0,1,0,3,12]


s.moveZeroes(&a)
a == [1,3,12,0,0]

a = [1]
s.moveZeroes(&a)

a = [11,1,1,5,6,7,0]
s.moveZeroes(&a)




//: [Next](@next)
