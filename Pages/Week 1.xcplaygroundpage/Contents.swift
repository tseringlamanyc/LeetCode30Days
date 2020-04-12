import UIKit

// Given a non-empty array of integers, every element appears twice except for one. Find that single one.

func singleNumber(_ nums: [Int]) -> Int {
    
    var dict = [Int: Int]()
    let count = 1
    
    for num in nums {
        if dict[num] == nil {
            dict[num] = count
        } else {
            dict[num] = nil
        }
    }
    
    return dict.first!.key
    
}

singleNumber([2,2,1])

/*
 Input: 19
 Output: true
 Explanation:
 12 + 92 = 82
 82 + 22 = 68
 62 + 82 = 100
 12 + 02 + 02 = 1
 */

func isHappy(_ n: Int) -> Bool {
    
    var digitSet = Set<Int>()
    var result = true
    
    var digitArray = [Int]()
    
    var sum = 0
    
    var totalSum = 0
    
    for digit in n.description {
        digitArray.append(digit.wholeNumberValue ?? 1000)
    }
    
    for digit in digitArray {
        sum += digit * digit
    }
    
    totalSum = sum
    
    if digitSet.contains(totalSum) {
        result = false
    } else {
        guard totalSum != 1 else {return true}
        digitSet.insert(totalSum)
        isHappy(totalSum)
    }
    
    return result
}

isHappy(19)

/*
 MAX SUBARRAY
 Input: [-2,1,-3,4,-1,2,1,-5,4],
 Output: 6
 Explanation: [4,-1,2,1] has the largest sum = 6.
 */

func maxSubArray(_ nums: [Int]) -> Int {
    guard nums.count >= 2 else {return nums.first ?? -10000}
    
    var currentMax = nums[0]
    var globalMax = nums[0]
    
    for index in 1..<nums.count {
        currentMax = max(nums[index], currentMax + nums[index])
        
        if currentMax > globalMax {
            globalMax = currentMax
        }
    }
    return globalMax
}

maxSubArray([-2,1,-3,4,-1,2,1,-5,4])

/*
 MOVE ZEROS
 Input: [0,1,0,3,12]
 Output: [1,3,12,0,0]
 */

func moveZeroes(_ nums: inout [Int]) {
    var j = 0
    
    for index in 0..<nums.count {
        if nums[index] != 0 {
            let previous = nums[j]
            nums[j] = nums[index]
            nums[index] = previous
            j += 1
        }
    }
}

var input = [0,1,0,3,12]

moveZeroes(&input)


// MAX PROFIT
func maxProfit(_ prices: [Int]) -> Int {
    guard !prices.isEmpty else {return 0}
    
    var maxProfit = 0
    
    for index in 1..<prices.count {
        let temp = prices[index - 1]
        if prices[index] > temp {
            maxProfit += prices[index] - temp
        }
    }
    return maxProfit
}

/*
 GROUP ANAGRAMS
 Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
 Output:
 [
 ["ate","eat","tea"],
 ["nat","tan"],
 ["bat"]
 ]
 */

func groupAnagrams(_ strs: [String]) -> [[String]] {
    var answer = [[String]]()
    var anaDict = [String: [String]]()
    
    for words in strs {
        let sortedString = String(words.sorted())
        if anaDict[sortedString] == nil {
            anaDict[sortedString] = [words]
        } else {
            anaDict[sortedString]?.append(words)
        }
    }
    
    for (_,value) in anaDict {
        answer.append(value)
    }
    
    return answer
}

groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"])

/*
 COUNTING ELEMENTS
 Input: arr = [1,2,3]
 Output: 2
 Explanation: 1 and 2 are counted cause 2 and 3 are in arr.
 If there're duplicates in arr, count them seperately.
 */

func countElements(_ arr: [Int]) -> Int {
    guard !arr.isEmpty else {return 0}
    
    var answer = 0
    
    for num in arr {
        if arr.contains(num) && arr.contains(num + 1) {
            answer += 1
        }
    }
    return answer
}

countElements([1,2,3])
