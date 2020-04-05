//: [Previous](@previous)

//97.60%
//Runtime: 12 ms
//Memory Usage: 21.1 MB

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let p1 = l1 else { return l2 }
        guard let p2 = l2 else { return l1 }
        
        let (p, q) = p1.val <= p2.val ? (p1, p2) : (p2, p1)
        p.next = mergeTwoLists(p.next, q)
        return p
    }
}

let s = Solution()

let l1 = ListNode(1)
l1.next = ListNode(2)
l1.next?.next = ListNode(4)

let l2 = ListNode(1)
l2.next = ListNode(3)
l2.next?.next = ListNode(4)

s.mergeTwoLists(l1, l2)?.show()


//: [Next](@next)
