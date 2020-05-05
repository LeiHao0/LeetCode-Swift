//: [Previous](@previous)

//Runtime: 84 ms
//Memory Usage: 21.2 MB
//66.82%

class Solution {
    //Runtime: 80 ms
    //Memory Usage: 20.9 MB
    //86.84%
    func singleNumber(_ nums: [Int]) -> Int {
        var r = 0
        for i in nums {
            r ^= i
        }
        return r
    }
    
    //Runtime: 84 ms
    //Memory Usage: 21.2 MB
    //66.82%
    func singleNumber1(_ nums: [Int]) -> Int {
        return nums.reduce(0) { $0 ^ $1 }
    }
}

let s = Solution()

s.singleNumber([2,2,1]) == 1
s.singleNumber([4,1,2,1,2]) == 4
s.singleNumber([4]) == 4
s.singleNumber([4,3,3]) == 4

//: [Next](@next)
