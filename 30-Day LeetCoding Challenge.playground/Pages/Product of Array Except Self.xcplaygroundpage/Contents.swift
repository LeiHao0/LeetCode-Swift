//: [Previous](@previous)

/**
 # Product of Array Except Self

 Given an array `nums` of *n* integers where *n* > 1,  return an array `output` such that `output[i]` is equal to the product of all the elements of `nums` except `nums[i]`.

 **Example:**

 ```
 Input:  [1,2,3,4]
 Output: [24,12,8,6]
 ```

 **Constraint:** It's guaranteed that the product of the elements of any prefix or suffix of the array (including the whole array) fits in a 32 bit integer.

 **Note:** Please solve it **without division** and in O(*n*).

 **Follow up:**
 Could you solve it with constant space complexity? (The output array **does not** count as extra space for the purpose of space complexity analysis.)
 */


class Solution {
    //    88 ms, 100%
    //    Memory Usage: 24.2 MB
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var a = Array(repeating: 1, count: nums.count), t = 1, j = nums.count-2
        for i in 1..<nums.count {
            a[i] = a[i-1] * nums[i-1]
        }
        while j >= 0 {
            t *= nums[j+1]
            a[j] *= t
            j -= 1
        }
        return a
    }
}

let s = Solution()
s.productExceptSelf([1,2,3,4]) // [24,12,8,6]

//: [Next](@next)
