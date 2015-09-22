//
//  main.swift
//  swift-2.0-sample
//
//  Created by kigi on 7/30/15.
//  Copyright © 2015 kigi. All rights reserved.
//

import Foundation

// MARK: Immutable and Mutable

var array1 = [1, 2, 3, 4, 5]

print("before append: \(array1)")
array1.append(6)
print("after append: \(array1)")

array1[0] = 100
print("after change 0-index: \(array1)")

let array2 = [1, 2, 3, 4, 5]

//array2.append(1000)

//array2[0] = 100000

//array2 += [10]

// MARK: Repeat and combine

var threeDoubles = [Double](count: 3, repeatedValue: 0.0)
print("threeDoubles = \(threeDoubles)")

var anotherDoubles = [Double](count: 4, repeatedValue: 2.5)

threeDoubles += anotherDoubles
print("threeDoubles = \(threeDoubles)")