//: [Previous](@previous)

class Solution {
    // 16 ms, 85.22%, 😂
    func search(_ nums: [Int], _ target: Int) -> Int {
        return nums.firstIndex(of: target) ?? -1
    }
    
    func search0(_ nums: [Int], _ target: Int) -> Int {
//        var i = pivot(nums, nums.count/2)
        
        return 0
    }
    
//    private func pivot(_ nums: [Int], _ i: Int) -> Int {
//        var v = i
//        if let i0 = nums[..<i].first, let i1 = nums[..<i].last  {
//            if i0 > i1 {
//
//            }
//        }
//    }
    
}

let s = Solution()
s.search([4,5,6,7,0,1,2], 0) // 4
s.search([4,5,6,7,0,1,2], 3) // -1

//: [Next](@next)
