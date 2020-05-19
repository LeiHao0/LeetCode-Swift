//: [Previous](@previous)

/**
 # Number of Islands

 Given a 2d grid map of `'1'`s (land) and `'0'`s (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

 **Example 1:**

 ```
 Input:
 11110
 11010
 11000
 00000

 Output: 1
 ```

 **Example 2:**

 ```
 Input:
 11000
 11000
 00100
 00011

 Output: 3
 ```
 */

class Solution {
    //    Runtime: 184 ms, 71.27%
    //    Memory Usage: 21.7 MB
    func numIslands(_ grid: [[Character]]) -> Int {
        if grid.isEmpty || grid[0].isEmpty { return 0 }
        var bits = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count), v = 0
        for i in 0 ..< grid.count {
            for j in 0 ..< grid[0].count {
                if !bits[i][j], check(i, j, grid, &bits) { v += 1 }
            }
        }
        return v
    }

    private func check(_ i: Int, _ j: Int, _ grid: [[Character]], _ bits: inout [[Bool]]) -> Bool {
        if i < 0 || j < 0 || i >= bits.count || j >= bits[0].count || grid[i][j] == "0" || bits[i][j] == true { return false }
        bits[i][j] = true
        check(i + 1, j, grid, &bits); check(i, j + 1, grid, &bits); check(i - 1, j, grid, &bits); check(i, j - 1, grid, &bits)
        return true
    }
}

let s = Solution()
s.numIslands([])
s.numIslands([[]])
s.numIslands([["1", "1", "1"], ["0", "1", "0"], ["1", "1", "1"]]) // 1
s.numIslands([["1", "1", "1", "1", "0"], ["1", "1", "0", "1", "0"], ["1", "1", "0", "0", "0"], ["0", "0", "0", "0", "0"]]) // 1
s.numIslands([["1", "1", "0", "0", "0"], ["1", "1", "0", "0", "0"], ["0", "0", "1", "0", "0"], ["0", "0", "0", "1", "1"]]) // 3

//: [Next](@next)
