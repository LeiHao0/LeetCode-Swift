//: [Previous](@previous)

/**
 # Merge Sorted Array

 Given two sorted integer arrays *nums1* and *nums2*, merge *nums2* into *nums1* as one sorted array.

 **Note:**

 - The number of elements initialized in *nums1* and *nums2* are *m* and *n* respectively.
 - You may assume that *nums1* has enough space (size that is greater or equal to *m* + *n*) to hold additional elements from *nums2*.

 **Example:**

 ```
 Input:
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6],       n = 3

 Output: [1,2,2,3,5,6]
 ```

   Hide Hint #1

 You can easily solve this problem if you simply think about two elements at a time rather than two arrays. We know that each of the individual arrays is sorted. What we don't know is how they will intertwine. Can we take a local decision and arrive at an optimal solution?

   Hide Hint #2

 If you simply consider one element each at a time from the two arrays and make a decision and proceed accordingly, you will arrive at the optimal solution.
 */

class Solution {
    // 12ms, 85.93%
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _: Int) {
        nums1 = (nums1[..<m] + nums2).sorted()
    }

    // 12ms, 85.93%, same...
    func merge0(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _: Int) {
        let nums0 = nums1[..<m]
        var i = 0, j = 0, k = 0
        while i < nums0.count, j < nums2.count {
            if nums0[i] < nums2[j] {
                nums1[k] = nums0[i]
                i += 1
            } else {
                nums1[k] = nums2[j]
                j += 1
            }
            k += 1
        }
        while i < nums0.count {
            nums1[k] = nums0[i]
            i += 1
            k += 1
        }
        while j < nums2.count {
            nums1[k] = nums2[j]
            j += 1
            k += 1
        }
    }
}

let s = Solution()
var a = [1, 2, 3, 0, 0, 0], b = [2, 5, 6]

s.merge(&a, 3, b, 3)
a

//: [Next](@next)
