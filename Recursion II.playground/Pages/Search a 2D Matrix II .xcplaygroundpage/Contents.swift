//: [Previous](@previous)

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let n = matrix.count-1, m = matrix.first?.count ?? 0; var i = n, j = 0
        while i >= 0 && j < m {
            if target > matrix[i][j] {
                j += 1
            } else if target < matrix[i][j] {
                i -= 1
            } else {
                return true
            }
        }
        return false
    }
}


let s = Solution()

let m1 = [
    [1,   4,  7, 11, 15],
    [2,   5,  8, 12, 19],
    [3,   6,  9, 16, 22],
    [10, 13, 14, 17, 24],
    [18, 21, 23, 26, 30]
]

s.searchMatrix(m1, 5) == true
s.searchMatrix(m1, 20) == false

let m2 = [[5,6,10,14],
          [6,10,13,18],
          [10,13,18,19]]

s.searchMatrix(m2, 14) == true

//: [Next](@next)
