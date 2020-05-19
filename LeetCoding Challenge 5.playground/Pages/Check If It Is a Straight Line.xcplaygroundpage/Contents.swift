//: [Previous](@previous)

/**
 # Check If It Is a Straight Line

 You are given an array `coordinates`, `coordinates[i] = [x, y]`, where `[x, y]` represents the coordinate of a point. Check if these points make a straight line in the XY plane.

 **Example 1:**

 ![img](https://assets.leetcode.com/uploads/2019/10/15/untitled-diagram-2.jpg)

 ```
 Input: coordinates = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]]
 Output: true
 ```

 **Example 2:**

 **![img](https://assets.leetcode.com/uploads/2019/10/09/untitled-diagram-1.jpg)**

 ```
 Input: coordinates = [[1,1],[2,2],[3,4],[4,5],[5,6],[7,7]]
 Output: false
 ```

 **Constraints:**

 - `2 <= coordinates.length <= 1000`
 - `coordinates[i].length == 2`
 - `-10^4 <= coordinates[i][0], coordinates[i][1] <= 10^4`
 - `coordinates` contains no duplicate point.

   Hide Hint #1

 If there're only 2 points, return true.

   Hide Hint #2

 Check if all other points lie on the line defined by the first 2 points.

   Hide Hint #3

 Use cross product to check collinearity.
 */

class Solution {
    // 40ms, 100%
    func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
        let x1 = coordinates[0][0], y1 = coordinates[0][1], x2 = coordinates[1][0], y2 = coordinates[1][1]
        if x2 == x1 { // y = b
            for i in 2 ..< coordinates.count {
                if coordinates[i][0] != x1 { return false }
            }
        } else { // y = ax + b || y = b
            let a = (y2 - y1) / (x2 - x1)
            let b = y1 - a * x1
            for i in 2 ..< coordinates.count {
                if coordinates[i][1] != a * coordinates[i][0] + b { return false }
            }
        }
        return true
    }
}

let s = Solution()
s.checkStraightLine([[1, 2], [2, 3], [3, 4], [4, 5], [5, 6], [6, 7]])
s.checkStraightLine([[1, 1], [2, 2], [3, 4], [4, 5], [5, 6], [7, 7]])
s.checkStraightLine([[1, 1], [2, 2]])
s.checkStraightLine([[-7, -3], [-7, -1], [-2, -2], [0, -8], [2, -2], [5, -6], [5, -5], [1, 7]])

//: [Next](@next)
