//: [Previous](@previous)

//Runtime: 496 ms
//Memory Usage: 24.5 MB
//37.40%

class Solution {
    
    func sortArray(_ nums: [Int]) -> [Int] {
        if nums.count < 2 { return nums }
        let i = nums.count/2, l = sortArray(Array(nums[..<i])), r = sortArray(Array(nums[i...]))
        print(l, r)
        return merge(l, r)
    }
    
    private func merge(_ n1: [Int], _ n2: [Int]) -> [Int] {
        var i1 = 0, i2 = 0
        var arr = [Int]()
        while i1 < n1.count, i2 < n2.count {
            if n1[i1] < n2[i2] {
                arr.append(n1[i1])
                i1 += 1
            } else {
                arr.append(n2[i2])
                i2 += 1
            }
        }
        while i1 < n1.count {
            arr.append(n1[i1])
            i1 += 1
        }
        while i2 < n2.count {
            arr.append(n2[i2])
            i2 += 1
        }
        
        return arr
    }
    
    func swiftSort(_ nums: [Int]) -> [Int] {
        return nums.sorted() // 70.40% 😂😂😂
    }
}

let s = Solution()

s.sortArray([5,2,3,1])

assert(s.sortArray([5,2,3,1]) == [1,2,3,5])
assert(s.sortArray([5,1,1,2,0,0]) == [0,0,1,1,2,5])


//: [Next](@next)
