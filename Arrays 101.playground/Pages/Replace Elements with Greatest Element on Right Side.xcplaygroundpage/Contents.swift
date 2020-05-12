//: [Previous](@previous)

class Solution {
    // 140ms, 80.00%
    func replaceElements(_ arr: [Int]) -> [Int] {
        var i = arr.count-1, rMax = -1, newArr = arr
        while i >= 0 {
            newArr[i] = rMax
            rMax = max(rMax, arr[i])
            i -= 1
        }
        return newArr
    }
}

let s = Solution()
s.replaceElements([17,18,5,4,6,1])


//: [Next](@next)
