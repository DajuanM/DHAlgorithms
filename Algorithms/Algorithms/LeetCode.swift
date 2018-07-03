//
//  LeetCode.swift
//  Algorithms
//
//  Created by swartz006 on 2017/8/16.
//  Copyright © 2017年 swartz006. All rights reserved.
//

import Foundation
//MARK: 605. Can Place Flowers
func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
    var count: Int = 0
    var arr = flowerbed
    for i in 0..<arr.count {
        if (arr[i] == 0 && (i == 0 || arr[i - 1] == 0) && (i == arr.count - 1 || arr[i + 1] == 0)) {
            arr[i] = 1
            count += 1
        }
        if  count >= n {
            return true
        }
    }
    return false
}
//MARK: 581. Shortest Unsorted Continuous Subarray
func findUnsortedSubarray(_ nums: [Int]) -> Int {
    var arr = nums
    arr.sort()
    var start = 0
    var end = nums.count - 1
    while start < nums.count && nums[start] == arr[start] {
        start += 1
    }
    
    while end > start && nums[end] == arr[end] {
        end -= 1
    }
    return end - start + 1
}

//var arr = [1,2,3,4]
//print(findUnsortedSubarray(arr))


func matrixReshape(_ nums: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
    var tmp: [Int] = nums.flatMap{$0}
    guard tmp.count % (r * c) == 0 else {
        return nums
    }
    var arr: [[Int]] = []
    for i in 0..<r {
        var t: [Int] = []
        for j in 0..<c {
            t.append(tmp[i*c+j])
        }
        arr.append(t)
    }
    return arr
}
//print(matrixReshape([[1,2],[3,4]], 2, 4))

//MARK: 561. Array Partition I
func arrayPairSum(_ nums: [Int]) -> Int {
    guard nums.count % 2 == 0 else {
        return 0
    }
    var arr = nums
    arr.sort()
    var sum = 0
    for i in 0..<arr.count {
        if i % 2 == 0 {
            sum += arr[i]
        }
    }
    return sum
}

//print(arrayPairSum([1,4,3,2]))

//532. K-diff Pairs in an Array
func findPairs(_ nums: [Int], _ k: Int) -> Int {
    if nums.count < 2 || k < 0 {
        return 0
    }
    var arr = nums
    arr.sort()
    var count = 0, left = 0, right = 1
    while right < arr.count {
        let lNum = arr[left]
        let rNum = arr[right]
        if rNum - lNum < k {
            right += 1
        }else if (rNum - lNum > k) {
            left += 1
        }else {
            count += 1
            while left < arr.count && arr[left] == lNum {
                left += 1
            }
            while right < arr.count && arr[right] == rNum {
                right += 1
            }
        }
        if right == left {
            right += 1
        }
    }
    return count
}

//print(findPairs([1, 3, 1, 5, 4], 0))

//MARK: 485. Max Consecutive Ones
func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
    var count = 0,maxCount = 0
    var i = 0
    while i < nums.count {
        while i < nums.count && nums[i] == 1{
            count += 1
            i += 1
        }
        if count > maxCount {
            maxCount = count
        }
        count = 0
        i += 1
    }
    return maxCount
}
//print(findMaxConsecutiveOnes([0,1,1,1,1,1,1,1,1,0,1]))

//MARK: 448. Find All Numbers Disappeared in an Array
func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    var tmp = nums;
    var arr: [Int] = []
    for i in 0..<tmp.count {
        let index = abs(tmp[i])  - 1
        if tmp[index] > 0 {
            tmp[index] *= -1
        }
    }
    for i in 0..<tmp.count {
        if tmp[i] > 0 {
            arr.append(i+1)
        }
    }
    return arr;
}
//print(findDisappearedNumbers([4,3,2,7,8,2,3,1]))

func maxNum(_ a: Int,_ b: Int) -> Int
{
    return a > b ? a : b
}
func minNum(_ a: Int,_ b: Int) -> Int
{
    return a < b ? a : b
}
//MARK: 624. Maximum Distance in Arrays
func maxDistance(_ arrays: [[Int]]) -> Int {
    var result = Int.min
    var minValue = arrays[0][0]
    var maxValue = arrays[0][arrays[0].count-1]
    
    for i in 1..<arrays.count {
        let arr = arrays[i]
        result = max(result, abs(minValue - arr[arr.count-1]))
        result = max(result, abs(maxValue - arr[0]))
        minValue = min(minValue, arr[0])
        maxValue = max(maxValue, arr[arr.count-1])
    }
    
    return result
}
//print(maxDistance([[1],[1]]))

//MARK: 628. Maximum Product of Three Numbers
func maximumProduct(_ nums: [Int]) -> Int {
    if nums.count < 3 {
        return 0
    }
    var nums = nums.sorted()
    let num1 = nums[nums.count - 1]
    let num2 = nums[nums.count - 2]
    let num3 = nums[nums.count - 3]
    let num4 = nums[1]
    let num5 = nums[0]
    let max1 = num1 * num2 * num3
    let max2 = num1 * num4 * num5
    return max(max1, max2)
}

//print(maximumProduct([1,2,3,4]))

//MARK: 414. Third Maximum Number
func thirdMax(_ nums: [Int]) -> Int {
    var nums = nums.sorted()
    var tmp = 2
    var max = 0
    for i in (0..<nums.count).reversed() {
        if i-1 >= 0 && nums[i-1] < nums[i] {
            tmp -= 1
            if tmp == 0 {
                max = nums[i-1]
            }
        }
    }
    return tmp <= 0 ? max : nums[nums.count-1]
}

//MARK: 给你六种面额 1、5、10、20、50、100 元的纸币，假设每种币值的数量都足够多，编写程序求组成N元（N为0~10000的非负整数）的不同组合的个数。
//func pagerMoney (_ num: Int) {
//    let money = [1, 5, 10, 20, 50, 100]
//
//}



//MARK: 198. House Robber
func rob(_ nums: [Int]) -> Int {
    var sum1 = 0
    var sum2 = 0
    for i in 0..<nums.count {
        if i % 2 == 0 {
            sum1 += nums[i]
        }else {
            sum2 += nums[i]
        }
    }
    return max(sum1, sum2)
}

//MARK: 557. Reverse Words in a String III
func reverseWords(_ s: String) -> String {
    let arr = s.components(separatedBy: " ")
    var str = ""
    for (index, t) in arr.enumerated() {
        str.append(reverseStr(t))
        if index < arr.count-1 {
            str.append(" ")
        }
    }
    return str
}

func reverseStr(_ s: String) -> String {
    var str = ""
    for c in s.reversed() {
        str.append(c)
    }
    return str
}
//MARK: 551. Student Attendance Record I
func checkRecord(_ s: String) -> Bool {
    var aCount = 0
    for (index, value) in s.enumerated() {
        if value == "A"{
            aCount += 1
            if aCount > 1 {
                return false
            }
            
        }else {
            if value == "L" && index > 0 && index < s.count - 1 {
                let c1 = s.index(s.startIndex, offsetBy: index-1)
                let c2 = s.index(s.startIndex, offsetBy: index+1)
                if s[c1] == "L" && s[c2] == "L" {
                    return false
                }
            }
        }
    }
    return true
}

//MARK: 541. Reverse String II
func reverseStr(_ s: String, _ k: Int) -> String {
    let n = s.count % k == 0 ? s.count / k : s.count / k + 1
    var str = ""
    for i in 0..<n {
        let startIndex = s.index(s.startIndex, offsetBy: i * k)
        var endIndex: String.Index
        if  i * k + k >= s.count {
            endIndex = s.index(s.startIndex, offsetBy: s.count)
        }else {
            endIndex = s.index(s.startIndex, offsetBy: i * k + k)
        }
        
        var tmp = s[startIndex..<endIndex]
        if i % 2 == 0 {
            tmp = reverseStr(tmp)
        }
        str.append(tmp)
    }
    return str
}

//MARK: 657. Judge Route Circle
func judgeCircle(_ moves: String) -> Bool {
    var uCount = 0
    var dCount = 0
    var lCount = 0
    var rCount = 0
    for s in moves {
        if s == "U" {
            uCount += 1
        }else if s == "D" {
            dCount += 1
        }else if s == "L" {
            lCount += 1
        }else {
            rCount += 1
        }
    }
    if uCount == dCount && lCount == rCount {
        return true
    }
    return false
}

//606. Construct String from Binary Tree
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func tree2str(_ t: TreeNode?) -> String {
    return binaryTraverse(t)
}

func binaryTraverse(_ t: TreeNode?) -> String {
    guard let t = t else {
        return ""
    }
    let l = binaryTraverse(t.left)
    let r = binaryTraverse(t.right)
    if l == "" && r == "" {
        return "\(t.val)"
    }
    if r == "" && l != "" {
        return "\(t.val)(\(l))"
    }
    return "\(t.val)(\(l))(\(r))"
}
// 521. Longest Uncommon Subsequence I
func findLUSlength(_ a: String, _ b: String) -> Int {
    var arr: [Int] = []
    if a.count !=  b.count {
        return max(Int(a.count), Int(b.count))
    }
    
    
    for (i, c1) in a.enumerated() {
        var count = 0
        var tmpArr = Array(b)
        for j in i..<b.count {
            let c2 = tmpArr[j]
            if c1 != c2 {
                count += 1
            }else {
                break
            }
        }
        arr.append(count)
        count = 0
    }
    if arr.count == 0 {
        return -1
    }
    var tmp = arr[0]
    for k in arr {
        if k > tmp {
            tmp = k
        }
    }
    if tmp == 0 {
        return -1
    }
    return tmp
}

func findErrorNums(_ nums: [Int]) -> [Int] {
    var k = 0
    for i in 0..<nums.count {
        if nums[i] != i+1 {
            k = i
            break
        }
    }
    return [nums[k], k+1]
}

//MARK: 50. Pow(x, n)
func myPow(_ x: Double, _ n: Int) -> Double {
    if n == 0 {
        return 1.0
    }
    let half: Double = myPow(x, n / 2)
    if n % 2 == 0 {
        return half * half
    }else if n > 0 {
        return half * half * x
    }else {
        return half * half / x
    }
}

//MARK: 147. Insertion Sort List
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

//func insertionSortList(_ head: ListNode?) -> ListNode? {
//    var sorted = 0
//    var p = ListNode(0)
//    p.next = head.copy()
//    while head?.next != nil {
//
//    }
//    return nil
//}

