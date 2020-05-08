//: [Previous](@previous)

/**
 # Subarray Sum Equals K

 Given an array of integers and an integer **k**, you need to find the total number of continuous subarrays whose sum equals to **k**.

 **Example 1:**

 ```
 Input:nums = [1,1,1], k = 2
 Output: 2
 ```



 **Note:**

 1. The length of the array is in range [1, 20,000].
 2. The range of numbers in the array is [-1000, 1000] and the range of the integer **k** is [-1e7, 1e7].



   Hide Hint #1

 Will Brute force work here? Try to optimize it.

   Hide Hint #2

 Can we optimize it by using some extra space?

   Hide Hint #3

 What about storing sum frequencies in a hash table? Will it be useful?

   Hide Hint #4

 sum(i,j)=sum(0,j)-sum(0,i), where sum(i,j) represents the sum of all the elements from index i to j-1. Can we use this property to optimize it.
 */

class Solution {
    // 144ms, 33.25%
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var v = 0, sum = 0, dict = [0: 1]
        for n in nums {
            sum += n
            v += dict[sum-k] ?? 0
            dict[sum] = (dict[sum] ?? 0) + 1
        }
        return v
    }
    
    // 2580 ms, 😂
    func subarraySum1(_ nums: [Int], _ k: Int) -> Int {
        var n = 0
        for i in 0..<nums.count {
            var sum = 0
            for j in i..<nums.count {
                sum += nums[j]
                if sum == k { n += 1 }
            }
        }
        return n
    }
    
    // 3460ms, 😂😂
    func subarraySum0(_ nums: [Int], _ k: Int) -> Int {
        var sums = Array(repeating: 0, count: nums.count+1), n = 0
        for (i, v) in nums.enumerated() {
            sums[i+1] = sums[i] + v
        }
        for i in 0..<sums.count {
            for j in i+1..<sums.count {
                if sums[j] - sums[i] == k { n += 1 }
            }
        }
        return n
    }
}

let s = Solution()
s.subarraySum([1,1,1], 2)
s.subarraySum([1], 0)


//: [Next](@next)
