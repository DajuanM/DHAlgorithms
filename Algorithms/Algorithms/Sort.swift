//
//  Sort.swift
//  Algorithms
//
//  Created by aiden on 2017/7/18.
//  Copyright © 2017年 swartz006. All rights reserved.
//

import Foundation

//MARK: 快速排序
var quikSortArr = [5, 1, 8, 9, 4]
func quikSort(left: Int, right: Int) {
    if left > right {
        return
    }
    var i = left
    var j = right
    let tmp = quikSortArr[left]
    while i != j {
        while quikSortArr[j] >= tmp && i < j {
            j -= 1
        }
        while quikSortArr[i] <= tmp && i < j  {
            i += 1
        }
        if i < j {
            let t = quikSortArr[i]
            quikSortArr[i] = quikSortArr[j]
            quikSortArr[j] = t
        }
    }
    quikSortArr[left] = quikSortArr[i]
    quikSortArr[i] = tmp
    quikSort(left: left, right: i-1)
    quikSort(left: i+1, right: right)
}
//quikSort(left: 0, right: quikSortArr.count-1)
