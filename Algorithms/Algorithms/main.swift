//
//  main.swift
//  Algorithms
//
//  Created by swartz006 on 2017/6/12.
//  Copyright © 2017年 swartz006. All rights reserved.
//

import Foundation

//print(findErrorNums([3, 2, 2]))
//print(-4 % 2)
//print(myPow(2, -4))
//
//
//print(findLUSlength("horbxeemlgqpqbujbdagizcfairalg",
//    "iwvtgyojrfhyzgyzeikqagpfjoaeen"))
//let arr = [1,2,3,4,5]
//print(twoSum(arr, 5)!)

//let str = "Aqwe"
//for c in str {
//    var t = 0
//    for num in c.unicodeScalars {
//        t = Int(num.value)
//    }
//    print(c)
//    print(t)
//    if t >= 65, t <= 90 {
//        print("大写")
//    }else if t >= 97, t <= 122 {
//        print("小写")
//    }
//}

// --
class Node {
    var value = 0
    var next: Node?
}


func createHead(arr: [Int]) -> Node? {
    var head: Node?
    for i in arr {
        let node = Node()
        node.value = i
        if head == nil {
            head = node
        }else {
            node.next = head
            head = node
        }
    }
    return head
}

func createEnd(arr: [Int]) -> Node? {
    var head: Node?
    var tail: Node?
    for i in arr {
        let node = Node()
        node.value = i
        if tail == nil {
            tail = node
            head = node
        }else {
            tail?.next = node
            tail = node
        }
    }
    return head
}

func travel(head: Node?) {
    var tmp = head
    while tmp?.next != nil {
        print(tmp?.value)
        tmp = tmp?.next
    }
    print(tmp?.value)
}

let node = createEnd(arr: [1,2,3,4])
travel(head: node)
//倒序
func reverseList(_ head: Node?) -> Node? {
  if head == nil || head?.next == nil {
      return head
  }

   var newHead: Node?
   var p = head
   while p != nil {
      let tmp = p?.next
      p?.next = newHead
      newHead = p
      p = tmp
   }
  return newHead
}

func reverseList1(_ head: Node?) -> Node? {
   if head == nil || head?.next == nil {
       return head
   }

   let newHead = reverseList1(head?.next)
   head?.next?.next = head
   head?.next = nil
   return newHead
  }

let node1 = reverseList1(node)
travel(head: node1)
