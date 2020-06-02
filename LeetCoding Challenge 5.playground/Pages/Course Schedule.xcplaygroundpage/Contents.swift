//: [Previous](@previous)

/**
 # Course Schedule

 There are a total of `numCourses` courses you have to take, labeled from `0` to `numCourses-1`.

 Some courses may have prerequisites, for example to take course 0 you have to first take course 1, which is expressed as a pair: `[0,1]`

 Given the total number of courses and a list of prerequisite **pairs**, is it possible for you to finish all courses?

 **Example 1:**

 ```
 Input: numCourses = 2, prerequisites = [[1,0]]
 Output: true
 Explanation: There are a total of 2 courses to take.
              To take course 1 you should have finished course 0. So it is possible.
 ```

 **Example 2:**

 ```
 Input: numCourses = 2, prerequisites = [[1,0],[0,1]]
 Output: false
 Explanation: There are a total of 2 courses to take.
              To take course 1 you should have finished course 0, and to take course 0 you should
              also have finished course 1. So it is impossible.
 ```

 **Constraints:**

 - The input prerequisites is a graph represented by **a list of edges**, not adjacency matrices. Read more about [how a graph is represented](https://www.khanacademy.org/computing/computer-science/algorithms/graph-representation/a/representing-graphs).
 - You may assume that there are no duplicate edges in the input prerequisites.
 - `1 <= numCourses <= 10^5`

   Hide Hint #1

 This problem is equivalent to finding if a cycle exists in a directed graph. If a cycle exists, no topological ordering exists and therefore it will be impossible to take all courses.

   Hide Hint #2

 [Topological Sort via DFS](https://class.coursera.org/algo-003/lecture/52) - A great video tutorial (21 minutes) on Coursera explaining the basic concepts of Topological Sort.

   Hide Hint #3

 Topological sort could also be done via [BFS](http://en.wikipedia.org/wiki/Topological_sorting#Algorithms).
 */

class Solution {
    // 88ms, 93.73%
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        checked = Array(repeating: false, count: numCourses); path = checked
        for prerequisite in prerequisites {
            dict[prerequisite[0], default: []].append(prerequisite[1])
        }
        for i in 0 ..< numCourses {
            if isCycle(i) { return false }
        }
        return true
    }

    private var checked, path: [Bool]!, dict = [Int: [Int]]()
    private func isCycle(_ i: Int) -> Bool {
        if checked[i] { return false }
        if path[i] { return true }
        path[i] = true
        var ret = false
        for t in dict[i] ?? [] {
            ret = isCycle(t)
            if ret { break }
        }
        path[i] = false
        checked[i] = true
        return ret
    }
}

let s = Solution()
s.canFinish(2, [[1, 0]])
s.canFinish(2, [[1, 0], [0, 1]])
s.canFinish(3, [[1, 0], [1, 2], [0, 1]])

//: [Next](@next)
