//: [Previous](@previous)

class Solution {
    // 224ms, 80.15%
    func validMountainArray(_ A: [Int]) -> Bool {
        var i = 0
        while i < A.count - 1, A[i] < A[i + 1] { i += 1 }
        if i == 0 || i == A.count - 1 { return false }
        while i < A.count - 1, A[i] > A[i + 1] { i += 1 }
        return i == A.count - 1
    }

    // 272ms, 9.92%
    func validMountainArray0(_ A: [Int]) -> Bool {
        if A.count < 3 { return false }
        var point = false
        if A[0] >= A[1] || A[A.count - 1] >= A[A.count - 2] { return false }
        for i in 1 ..< A.count - 1 {
            if A[i] == A[i - 1] { return false }
            if A[i] > A[i - 1], A[i] > A[i + 1] {
                point = true
            }
            if point, A[i] <= A[i + 1] {
                return false
            }
        }
        return point
    }
}

let s = Solution()
s.validMountainArray([2, 1])
s.validMountainArray([3, 5, 5])
s.validMountainArray([0, 3, 2, 1])
s.validMountainArray([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
s.validMountainArray([9, 8, 7, 6, 5, 4, 3, 2, 1, 0])
s.validMountainArray([0, 1, 2, 1, 2])
s.validMountainArray([2, 1, 2, 3, 5, 7, 9, 10, 12, 14, 15, 16, 18, 14, 13])

//: [Next](@next)
