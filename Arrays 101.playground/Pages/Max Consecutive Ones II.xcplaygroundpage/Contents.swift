//: [Previous](@previous)

class Solution {
    // 300ms, 31%
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var z0 = 0, z1 = 0, maxZ = 0
        for i in nums {
            if i == 1 {
                z1 += 1
            } else {
                z0 = z1
                z1 = 0
            }
            maxZ = max(maxZ, z0+z1+1)
        }
        return min(maxZ, nums.count)
    }
}

let s = Solution()
s.findMaxConsecutiveOnes([1,0,1,1,0])
s.findMaxConsecutiveOnes([1,0,0,1,1,0])
s.findMaxConsecutiveOnes([0,0,0,0,0,0,1,0])
s.findMaxConsecutiveOnes([0,0,0,0,0,0,0])
s.findMaxConsecutiveOnes([1,1,1,1,1])

//: [Next](@next)
