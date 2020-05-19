//: [Previous](@previous)

// Use `CMD + 1` to `Show Project Navigator`

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head?.next == nil { return head }

        let h = reverseList(head?.next)

        head?.next?.next = head
        head?.next = nil

        return h
    }
}

var h: ListNode? = ListNode(1)
// h = nil
h?.next = ListNode(2)
h?.next?.next = ListNode(3)
h?.next?.next?.next = ListNode(4)
h?.next?.next?.next?.next = ListNode(5)

ShowList(h)
let s = Solution()
h = s.reverseList(h)

ShowList(h)

//: [Next](@next)
