//: [Previous](@previous)

/**
 # Delete Node in a Linked List

 Solution

 Write a function to delete a node (except the tail) in a singly linked list, given only access to that node.

 Given linked list -- head = [4,5,1,9], which looks like following:

 ![img](https://assets.leetcode.com/uploads/2018/12/28/237_example.png)

 **Example 1:**

 ```
 Input: head = [4,5,1,9], node = 5
 Output: [4,1,9]
 Explanation: You are given the second node with value 5, the linked list should become 4 -> 1 -> 9 after calling your function.
 ```

 **Example 2:**

 ```
 Input: head = [4,5,1,9], node = 1
 Output: [4,5,9]
 Explanation: You are given the third node with value 1, the linked list should become 4 -> 5 -> 9 after calling your function.
 ```

 **Note:**

 - The linked list will have at least two elements.
 - All of the nodes' values will be unique.
 - The given node will not be the tail and it will always be a valid node of the linked list.
 - Do not return anything from your function.
 */

class Solution {
    // 16ms, 100%
    func deleteNode(_ node: ListNode?) {
        node?.val = node?.next?.val ?? -1
        node?.next = node?.next?.next
    }

    // 20ms, 98.55%
    func deleteNode0(_ node: ListNode?) {
        var p = node
        while let q = p?.next {
            p?.val = q.val
            q.next == nil ? (p?.next = nil) : (p = q)
        }
    }
}

//: [Next](@next)
