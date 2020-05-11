//: [Previous](@previous)

/**
 # Flood Fill

 An `image` is represented by a 2-D array of integers, each integer representing the pixel value of the image (from 0 to 65535).

 Given a coordinate `(sr, sc)` representing the starting pixel (row and column) of the flood fill, and a pixel value `newColor`, "flood fill" the image.

 To perform a "flood fill", consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel, plus any pixels connected 4-directionally to those pixels (also with the same color as the starting pixel), and so on. Replace the color of all of the aforementioned pixels with the newColor.

 At the end, return the modified image.

 **Example 1:**

 ```
 Input:
 image = [[1,1,1],[1,1,0],[1,0,1]]
 sr = 1, sc = 1, newColor = 2
 Output: [[2,2,2],[2,2,0],[2,0,1]]
 Explanation:
 From the center of the image (with position (sr, sc) = (1, 1)), all pixels connected
 by a path of the same color as the starting pixel are colored with the new color.
 Note the bottom corner is not colored 2, because it is not 4-directionally connected
 to the starting pixel.
 ```



 **Note:**

 The length of `image` and `image[0]` will be in the range `[1, 50]`.

 The given starting pixel will satisfy `0 <= sr < image.length` and `0 <= sc < image[0].length`.

 The value of each color in `image[i][j]` and `newColor` will be an integer in `[0, 65535]`.



   Hide Hint #1

 Write a recursive function that paints the pixel if it's the correct color, then recurses on neighboring pixels.
 */

class Solution {
    // 64ms, 76.14%
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        if newColor == image[sr][sc] { return image }
        var filledImage = image
        dfs(&filledImage, sr, sc, image[sr][sc], newColor)
        return filledImage
    }
    
    private func dfs(_  image: inout [[Int]], _ r: Int, _ c: Int, _ oriColor: Int, _ newColor: Int) {
        image[r][c] = newColor
        if r > 0, image[r-1][c] == oriColor {
            dfs(&image, r-1, c, oriColor, newColor)
        }
        if c > 0, image[r][c-1] == oriColor {
            dfs(&image, r, c-1, oriColor, newColor)
        }
        if r < image.count-1, image[r+1][c] == oriColor {
            dfs(&image, r+1, c, oriColor, newColor)
        }
        if c < (image.first?.count ?? 0) - 1, image[r][c+1] == oriColor {
            dfs(&image, r, c+1, oriColor, newColor)
        }
    }
}

let s = Solution()
s.floodFill([
    [1,1,1],
    [1,1,0],
    [1,0,1]
    ], 1, 1, 2)

s.floodFill([
    [0,0,0],
    [0,1,1]
], 1, 1, 1)




//: [Next](@next)
