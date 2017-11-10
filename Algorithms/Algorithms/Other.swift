//
//  Other.swift
//  Algorithms
//
//  Created by swartz006 on 2017/8/16.
//  Copyright © 2017年 swartz006. All rights reserved.
//

import Foundation

//二分查找算法
func binary_search (_ arr: [Int], _ k: Int) -> Int {
    var low = 0
    var high = arr.count - 1
    while low <= high {
        let middle = (high - low) / 2 + low
        //如果有重复数字会找到第一个
        if arr[middle] >= k {
            high = middle - 1
        }else {
            low = middle + 1
        }
        //如果有重复数字会找到最后一个
        if arr[middle] <= k {
            low = middle + 1
        }else {
            high = middle - 1
        }
        
    }
    return -1
}
