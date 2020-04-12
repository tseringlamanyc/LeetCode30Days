import UIKit

// MIDDLE LINKED LIST

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var arrLinkedList = [ListNode?]()
        
        var currentHead = head
        
        while currentHead != nil {
            arrLinkedList.append(currentHead)
            currentHead = currentHead?.next
        }
        
        return arrLinkedList[arrLinkedList.count / 2]
    }
    
    /*
     Floyds tortoise and hare method
     https://www.youtube.com/watch?v=3vU6kAa2mnI
     2 counters (a, b)
     a moves one while b moves twices
     */
    
    func middleNode2(_ head: ListNode?) -> ListNode? {
        var a = head // slow
        var b = head // fast
        
        while b?.next != nil {
            b = b?.next?.next
            a = a?.next
        }
        
        return a
    }
}

