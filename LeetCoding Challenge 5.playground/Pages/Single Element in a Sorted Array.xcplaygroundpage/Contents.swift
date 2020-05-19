//: [Previous](@previous)

/**
 # Single Element in a Sorted Array

 You are given a sorted array consisting of only integers where every element appears exactly twice, except for one element which appears exactly once. Find this single element that appears only once.

 **Example 1:**

 ```
 Input: [1,1,2,3,3,4,4,8,8]
 Output: 2
 ```

 **Example 2:**

 ```
 Input: [3,3,7,7,10,11,11]
 Output: 10
 ```

 **Note:** Your solution should run in O(log n) time and O(1) space.
 */

class Solution {
    // 56ms, 100%
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var i = 0, j = nums.count - 1
        while i < j {
            let mid = i + (j - i) / 2, isEven = mid % 2 == 0
            if nums[mid] == nums[mid + 1] {
                isEven ? (i = mid + 2) : (j = mid - 1)
            } else if nums[mid] == nums[mid - 1] {
                !isEven ? (i = mid + 1) : (j = mid - 2)
            } else {
                return nums[mid]
            }
        }
        return nums[i]
    }

    // 60ms, 92.59%
    func singleNonDuplicate0(_ nums: [Int]) -> Int {
        var i = 0, j = nums.count - 1
        while i <= j {
            let mid = i + (j - i) / 2
            if mid == 0 || mid == nums.count - 1 || (nums[mid - 1] != nums[mid] && nums[mid] != nums[mid + 1]) {
                return nums[mid]
            }
            if mid % 2 == 0 {
                nums[mid] == nums[mid + 1] ? (i = mid + 1) : (j = mid - 1)
            } else {
                nums[mid] == nums[mid - 1] ? (i = mid + 1) : (j = mid - 1)
            }
        }
        return -1
    }
}

let s = Solution()
s.singleNonDuplicate([1, 1, 2, 3, 3, 4, 4, 8, 8]) // 2
s.singleNonDuplicate([3, 3, 7, 7, 10, 11, 11]) // 10
s.singleNonDuplicate([1, 3, 3, 7, 7, 10, 10, 11, 11]) // 1
s.singleNonDuplicate([3, 3, 7, 7, 10, 10, 11]) // 11

//: [Next](@next)
