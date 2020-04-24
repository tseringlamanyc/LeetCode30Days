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

/*
 BACKSPACE STRING
 Given two strings S and T, return if they are equal when both are typed into empty text editors. # means a backspace character.
 Input: S = "ab#c", T = "ad#c"
 Output: true
 Explanation: Both S and T become "ac".
 */

func backspaceCompare(_ S: String, _ T: String) -> Bool {
    
    var sArray = Array(S)
    var tArray = Array(T)
    
    let sCounter = 0
    let tCounter = 0
    
    for _ in sCounter..<sArray.count {
        if let char = sArray.firstIndex(of: "#") {
            sArray.remove(at: char)
            if char - 1 >= 0 {
                sArray.remove(at: char - 1)
            }
        }
    }
    
    for _ in tCounter..<tArray.count {
        if let char = tArray.firstIndex(of: "#") {
            tArray.remove(at: char)
            if char - 1 >= 0 {
                tArray.remove(at: char - 1)
            }
        }
    }
    
    print(sArray.description, tArray.description)
    
    return sArray.description == tArray.description
}

backspaceCompare("","xywrrmu#p")

// Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

class MinStack {
    init() {
        
    }
    var arrOfInts = [Int]()
    var minNum = [Int]()
    
    func push(_ x: Int) {
        arrOfInts.append(x)
        
        if minNum.count == 0 {
            minNum.append(x)
        } else {
            if let minNumber = minNum.last, let lastNum = arrOfInts.last {
                if lastNum <= minNumber {
                    minNum.append(lastNum)
                }
            }
        }
    }
    
    func pop() -> Int {
        
        guard !arrOfInts.isEmpty else {
            return 0
        }
        
        let removedNum = arrOfInts.popLast()
        
        if let numRemoved = removedNum, let min1 = minNum.last {
            if numRemoved == min1 {
                minNum.removeLast()
            }
        }
        return removedNum ?? 1000
    }
    
    func top() -> Int {
        guard !arrOfInts.isEmpty else {
            return 0
        }
        return arrOfInts.last ?? 1000
    }
    
    func getMin() -> Int {
        return minNum.last ?? 1000
    }
}

// Last Stone Weight

func lastStoneWeight(stones: [Int]) -> Int {
    
    guard stones.count > 1 else {return stones.first!}
    
    var sortedStones = stones.sorted()
    
    let largestStone = sortedStones.removeLast()
    let secondLargest = sortedStones.removeLast()
    
    sortedStones.append(largestStone - secondLargest)
    return lastStoneWeight(stones: sortedStones)
    
}
