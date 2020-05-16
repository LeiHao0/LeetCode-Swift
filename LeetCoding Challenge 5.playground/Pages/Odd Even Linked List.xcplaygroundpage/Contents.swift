//: [Previous](@previous)

/**
 # Odd Even Linked List

 Given a singly linked list, group all odd nodes together followed by the even nodes. Please note here we are talking about the node number and not the value in the nodes.

 You should try to do it in place. The program should run in O(1) space complexity and O(nodes) time complexity.

 **Example 1:**

 ```
 Input: 1->2->3->4->5->NULL
 Output: 1->3->5->2->4->NULL
 ```

 **Example 2:**

 ```
 Input: 2->1->3->5->6->4->7->NULL
 Output: 2->3->6->7->1->5->4->NULL
 ```

 **Note:**

 - The relative order inside both the even and odd groups should remain as it was in the input.
 - The first node is considered odd, the second node even and so on ...
 */

class Solution {
    // 40 ms, 9.59%
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        let oddHead = head?.next
        var evenP = head, oddP = oddHead
        while oddP?.next != nil {
            evenP?.next = evenP?.next?.next
            oddP?.next = oddP?.next?.next
            evenP = evenP?.next
            oddP = oddP?.next
        }
        evenP?.next = oddHead
        return head
    }
}

let s = Solution()

let n = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))

var p = s.oddEvenList(n)
while p != nil {
    print(p?.val)
    p = p?.next
}

//: [Next](@next)
