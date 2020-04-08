//: [Previous](@previous)

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 { return 0 }
        if n == 1 { return nums[0] }
        
        let m = maxSubArray(Array(nums[0..<n-1]))
        print(m, m + nums[n-1], nums[n-1])
        return max(m + nums[n-1], nums[n-1])
        
        //        return 6
    }
}

let s = Solution()
s.maxSubArray([-2,1,-3,4,-1,2,1,-5,4]) == 6



//: [Next](@next)
