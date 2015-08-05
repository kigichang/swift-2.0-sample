//
//  main.swift
//  swift-2.0-sample
//
//  Created by kigi on 7/30/15.
//  Copyright © 2015 kigi. All rights reserved.
//

import Foundation

// MARK: Session 1.1 與 Object-C 差別
/*
print("Hello, World!")

var a = 0; print(a)
*/

// MARK: Session 1.2 變數宣告
/*
var a = 10; a = 20
let b = 10

let str = "Hello World!"

let aa = 10

let bb = 10.0

let str2: String = "Hello World!"

*/

// MARK: Session 1.3 Strong Type and String Interpolation

/*
let label = "This width is "
let width = 94
let widthLabel = label + String(width)

print(widthLabel)

let apples = 3
let oranges = 5

let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

print(appleSummary)
print(fruitSummary)
*/

// MARK: Session 1.4 Array and Dictionary
/*
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
print(shoppingList[0])

shoppingList[1] = "bottle of water"

print(shoppingList[1])

let emptyArray = [String]() // 指定資料型別
let emptyArray2 = []        // 不指定資料型別

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic"
]

print(occupations["Malcolm"])
    
occupations["Jayne"] = "Public Relations"
    
print(occupations["Jayne"])

let emptyDictionary = [String: Float]() // 指定資料型別
let emptyDictionary2 = [:]              // 不指定資料型別
*/

// MARK: Session 1.5 Control Flow
/*
// if

let score = 30

var teamScore = 0

if score >= 50 {
    teamScore += 3
}
else if score >= 30 {
    teamScore += 2
}
else {
    teamScore += 1
}

print(teamScore)
*/

/*
// Optional

var optionalString: String? = "Hello"

print(optionalString)

print(optionalString == nil)

var optionalName: String? = "John Appleseed"

var greeting = "Hello!"

if let name = optionalName {
    greeting = "Hello, \(name)"
}

print(greeting)

greeting = "Hello!"
optionalName = nil

if var name = optionalName {    // 也可以用 var，可以 re-assign
    greeting = "Hello, \(name)"
    name = "test var"
}

print(greeting)

*/

/*
//switch - case

let vegetable = "red pepper"

var vegetableComment = "Everything tastes good in soup."

switch vegetable {
    
case "celery":                          // 一般的比對
    vegetableComment = "Add some raisins and make ants on a log."
    
case "cucumber", "watercress":          // 符合多種條件
    vegetableComment = "That would make a good tea sandwich."
    
case let x where x.hasSuffix("pepper"): // 經過運算符合條件
    vegetableComment = "Is it a spicy \(x)?"
    
default:
    break   // 不做任何事，要用 break
    
}

print(vegetableComment)

*/

/*
// Range

print(1...10)
print(1..<20)
*/

/*
// for - in

for i in 1...10 {
    print(i)
}

for i in 1..<10 {
    print(i)
}

for var i = 0; i < 10; i++ {
    print(i)
}

let shoppingList = ["catfish", "water", "tulips", "blue paint"]

for item in shoppingList {
    print(item)
}


let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25]
]

var largest = 0

for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}

print(largest)
*/

/*
// while and repeat - while

var n = 2

while n < 100 {
    n *= 2
}

print(n)

var m = 2

repeat {
    m *= 2
} while m < 100

print(m)
*/

// MARK: Function and Closure

func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}

print(greet("Bob", day: "Tuesday"))



func total(amount: Int,times: Int, a: Int) -> Int {
    return amount * times * a
}

print(total(30, times: 20, a: 30))

func calc(scores: [Int]) -> (min: Int, max: Int, sum: Int, avg: Double) {
    
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        
        sum += score
    }
    
    return (min, max, sum, Double(sum) / Double(scores.count))
}

let result = calc([5, 3, 100, 3, 9])

print(result.3)     // by 0-index
print(result.avg)   // by name

func sumOf(numbers: Int...) -> Int {
    
    var sum = 0
    
    for number in numbers {
        sum += number
    }
    
    return sum
}

print(sumOf())
print(sumOf(42, 597, 12))