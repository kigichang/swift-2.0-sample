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