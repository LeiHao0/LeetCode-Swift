//: [Previous](@previous)

//Runtime: 8 ms
//Memory Usage: 20.9 MB

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let h = swap(head)
        h?.next?.next = swapPairs(h?.next?.next)
        return h
    }
    
    private func swap(_ head: ListNode?) -> ListNode? {
        if let h0 = head, let h1 = h0.next {
            h0.next = h1.next
            h1.next = h0
            return h1
        } else {
            return head
        }
    }
}

//: [Next](@next)
