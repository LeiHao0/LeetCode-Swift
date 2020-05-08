//: [Previous](@previous)


/**
 # Search in Rotated Sorted Array

 Solution

 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

 (i.e., `[0,1,2,4,5,6,7]` might become `[4,5,6,7,0,1,2]`).

 You are given a target value to search. If found in the array return its index, otherwise return `-1`.

 You may assume no duplicate exists in the array.

 Your algorithm's runtime complexity must be in the order of *O*(log *n*).

 **Example 1:**

 ```
 Input: nums = [4,5,6,7,0,1,2], target = 0
 Output: 4
 ```

 **Example 2:**

 ```
 Input: nums = [4,5,6,7,0,1,2], target = 3
 Output: -1
 ```
 */

class Solution {
    
    // 16 ms, 95.99%...
    func search(_ nums: [Int], _ target: Int) -> Int {
        var i = 0, j = nums.count-1
        while i <= j {
            let mid = i + (j - i)/2
            if nums[mid] == target {
                return mid
            } else if nums[mid] >= nums[i] {
                (target >= nums[i] && target < nums[mid]) ? (j = mid-1) : (i = mid+1)
            } else {
                (target <= nums[j] && target > nums[mid]) ? (i = mid+1) : (j = mid-1)
            }
        }
        return -1
    }
    
    // 16 ms, 95.99%, 😂
    func search0(_ nums: [Int], _ target: Int) -> Int {
        return nums.firstIndex(of: target) ?? -1
    }
    
}

let s = Solution()
s.search([4,5,6,7,0,1,2], 0) // 4
s.search([4,5,6,7,0,1,2], 3) // -1

//: [Next](@next)
