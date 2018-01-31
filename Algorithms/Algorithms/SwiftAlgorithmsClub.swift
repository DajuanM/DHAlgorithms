//
//  SwiftAlgorithmsClub.swift
//  Algorithms
//
//  Created by zipingfang on 2017/12/18.
//  Copyright © 2017年 swartz006. All rights reserved.
//

import Foundation

//MARK: 2sum
func twoSum(_ nums: [Int], _ tag: Int) -> (Int, Int)? {
    var dict = [Int: Int]()
    for (currentIndex, num) in nums.enumerated() {
        let tmp = tag - num
        if let tmpIndex = dict[tmp] {
            return (tmpIndex, currentIndex)
        }
        dict[num] = currentIndex
    }
    return nil
}
