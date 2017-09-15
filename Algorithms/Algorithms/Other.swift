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
        
        if arr[middle] == k {
            return middle
        }else if arr[middle] < k {
            low = middle + 1
        }else{
            high = middle - 1
        }
    }
    return -1
}
