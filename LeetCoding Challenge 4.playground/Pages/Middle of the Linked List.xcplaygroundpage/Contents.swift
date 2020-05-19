//: [Previous](@previous)

class Solution {
    //    Runtime: 0 ms
    //    Memory Usage: 20.8 MB
    //    100%
    func middleNode(_ head: ListNode?) -> ListNode? {
        var p = head, q = head
        while q?.next != nil {
            p = p?.next
            q = q?.next?.next
        }
        return p
    }
}

let s = Solution()

let h = ListNode(1)
h.next = ListNode(2)
h.next?.next = ListNode(3)

s.middleNode(h)?.val

h.next?.next?.next = ListNode(4)

s.middleNode(h)?.val

//: [Next](@next)
