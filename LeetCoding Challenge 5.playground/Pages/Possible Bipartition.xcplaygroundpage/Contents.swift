//: [Previous](@previous)

/**
 # Possible Bipartition

 Given a set of `N` people (numbered `1, 2, ..., N`), we would like to split everyone into two groups of **any** size.

 Each person may dislike some other people, and they should not go into the same group.

 Formally, if `dislikes[i] = [a, b]`, it means it is not allowed to put the people numbered `a` and `b` into the same group.

 Return `true` if and only if it is possible to split everyone into two groups in this way.

  

 **Example 1:**

 ```
 Input: N = 4, dislikes = [[1,2],[1,3],[2,4]]
 Output: true
 Explanation: group1 [1,4], group2 [2,3]
 ```

 **Example 2:**

 ```
 Input: N = 3, dislikes = [[1,2],[1,3],[2,3]]
 Output: false
 ```

 **Example 3:**

 ```
 Input: N = 5, dislikes = [[1,2],[2,3],[3,4],[4,5],[1,5]]
 Output: false
 ```

  

 **Note:**

 1. `1 <= N <= 2000`
 2. `0 <= dislikes.length <= 10000`
 3. `1 <= dislikes[i][j] <= N`
 4. `dislikes[i][0] < dislikes[i][1]`
 5. There does not exist `i != j` for which `dislikes[i] == dislikes[j]`.
 */

class Solution {
    
    // 880ms, 58.82%
    func possibleBipartition(_ N: Int, _ dislikes: [[Int]]) -> Bool {
        graph = Array(repeating: [Int](), count: N+1)
        for dislike in dislikes {
            let d0 = dislike[0], d1 = dislike[1]
            graph[d0].append(d1)
            graph[d1].append(d0)
        }
        for node in 1...N {
            if color[node] == nil && !dfs(node, 0) { return false }
        }
        return true
    }
    
    
    private var graph = [[Int]]()
    private var color = [Int: Int]()
    private func dfs(_ node: Int, _ c: Int) -> Bool {
        if let v = color[node] { return v == c }
        color[node] = c
        for i in graph[node] {
            if !dfs(i, c ^ 1) { return false }
        }
        return true
    }
}

let s = Solution()
s.possibleBipartition(4, [[1,2],[1,3],[2,4]])
s.possibleBipartition(3, [[1,2],[1,3],[2,3]])
s.possibleBipartition(5, [[1,2],[2,3],[3,4],[4,5],[1,5]])
s.possibleBipartition(1, [])
s.possibleBipartition(5, [[1,2],[3,4],[4,5],[3,5]])
s.possibleBipartition(10, [[4,7],[4,8],[2,8],[8,9],[1,6],[5,8],[1,2],[6,7],[3,10],[8,10],[1,5],[7,10],[1,10],[3,5],[3,6],[1,4],[3,9],[2,3],[1,9],[7,9],[2,7],[6,8],[5,7],[3,4]])




//: [Next](@next)
