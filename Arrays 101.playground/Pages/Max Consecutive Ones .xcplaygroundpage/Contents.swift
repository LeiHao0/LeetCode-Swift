//: [Previous](@previous)

/**
 # Max Consecutive Ones

 Given a binary array, find the maximum number of consecutive 1s in this array.

 **Example 1:**

 ```
 Input: [1,1,0,1,1,1]
 Output: 3
 Explanation: The first two digits or the last three digits are consecutive 1s.
     The maximum number of consecutive 1s is 3.
 ```



 **Note:**

 - The input array will only contain `0` and `1`.
 - The length of input array is a positive integer and will not exceed 10,000



   Hide Hint #1

 You need to think about two things as far as any window is concerned. One is the starting point for the window. How do you detect that a new window of 1s has started? The next part is detecting the ending point for this window. How do you detect the ending point for an existing window? If you figure these two things out, you will be able to detect the windows of consecutive ones. All that remains afterward is to find the longest such window and return the size.
 */

class Solution {
    
    //    Runtime: 292 ms, 47.50%
    //    Memory Usage: 21.1 MB
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var gv = 0, lv = 0
        for n in nums {
            if n == 1 {
                lv += 1
            } else {
                gv = max(lv, gv)
                lv = 0
            }
        }
        return max(lv, gv)
    }
    
    //    Runtime: 292 ms, 47.50%
    //    Memory Usage: 21.1 MB
    func findMaxConsecutiveOnes0(_ nums: [Int]) -> Int {
        return nums.split(separator: 0).reduce(0) { max($0, $1.count) }
    }
}

let s = Solution()
s.findMaxConsecutiveOnes([1,1,0,1,1,1])
s.findMaxConsecutiveOnes([1,1,0,1,0,0,1])


//: [Next](@next)
