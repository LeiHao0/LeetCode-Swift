//: [Previous](@previous)

/**
 # Minimum Path Sum

 Given a *m* x *n* grid filled with non-negative numbers, find a path from top left to bottom right which *minimizes* the sum of all numbers along its path.

 **Note:** You can only move either down or right at any point in time.

 **Example:**

 ```
 Input:
 [
   [1,3,1],
   [1,5,1],
   [4,2,1]
 ]
 Output: 7
 Explanation: Because the path 1→3→1→1→1 minimizes the sum.
 ```
 */

class Solution {
    // 64ms, 60.14%
    func minPathSum(_ grid: [[Int]]) -> Int {
        if grid.isEmpty || grid[0].isEmpty { return 0 }
        var mins = Array(repeating: Array(repeating: -1, count: grid[0].count), count: grid.count)
        return helper(grid, &mins, 0, 0)
    }

    private func helper(_ grid: [[Int]], _ mins: inout [[Int]], _ i: Int, _ j: Int) -> Int {
        if i == grid.count - 1, j == grid[0].count - 1 { return grid[i][j] }

        var d = Int.max, r = Int.max
        if i < grid.count - 1 {
            if mins[i + 1][j] == -1 {
                mins[i + 1][j] = helper(grid, &mins, i + 1, j)
            }
            d = mins[i + 1][j]
        }
        if j < grid[0].count - 1 {
            if mins[i][j + 1] == -1 {
                mins[i][j + 1] = helper(grid, &mins, i, j + 1)
            }
            r = mins[i][j + 1]
        }
        return grid[i][j] + min(r, d)
    }
}

let s = Solution()
s.minPathSum([[1, 3, 1], [1, 5, 1], [4, 2, 1]])
s.minPathSum([[7, 1, 3, 5, 8, 9, 9, 2, 1, 9, 0, 8, 3, 1, 6, 6, 9, 5], [9, 5, 9, 4, 0, 4, 8, 8, 9, 5, 7, 3, 6, 6, 6, 9, 1, 6], [8, 2, 9, 1, 3, 1, 9, 7, 2, 5, 3, 1, 2, 4, 8, 2, 8, 8], [6, 7, 9, 8, 4, 8, 3, 0, 4, 0, 9, 6, 6, 0, 0, 5, 1, 4], [7, 1, 3, 1, 8, 8, 3, 1, 2, 1, 5, 0, 2, 1, 9, 1, 1, 4], [9, 5, 4, 3, 5, 6, 1, 3, 6, 4, 9, 7, 0, 8, 0, 3, 9, 9], [1, 4, 2, 5, 8, 7, 7, 0, 0, 7, 1, 2, 1, 2, 7, 7, 7, 4], [3, 9, 7, 9, 5, 8, 9, 5, 6, 9, 8, 8, 0, 1, 4, 2, 8, 2], [1, 5, 2, 2, 2, 5, 6, 3, 9, 3, 1, 7, 9, 6, 8, 6, 8, 3], [5, 7, 8, 3, 8, 8, 3, 9, 9, 8, 1, 9, 2, 5, 4, 7, 7, 7], [2, 3, 2, 4, 8, 5, 1, 7, 2, 9, 5, 2, 4, 2, 9, 2, 8, 7], [0, 1, 6, 1, 1, 0, 0, 6, 5, 4, 3, 4, 3, 7, 9, 6, 1, 9]])

//: [Next](@next)
