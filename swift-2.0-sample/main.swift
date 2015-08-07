//
//  main.swift
//  swift-2.0-sample
//
//  Created by kigi on 7/30/15.
//  Copyright © 2015 kigi. All rights reserved.
//

import Foundation

// MARK: Class
/*
// Sample
class Shape {
    var numberOfSides = 0
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
}

let shape = Shape()
shape.numberOfSides = 7
print(shape.simpleDescription())
*/

/*
class NamedShape {
    
    var numberOfSides: Int = 0
    
    let name: String        // 未給值的常數變數
    
    init(name: String) {
        self.name = name    // 在 init 內，對常數指定值
    }
    
    func simpleDescription() -> String {
        return "A \(name) with \(numberOfSides) sides"
    }
    
    deinit {
        print("\(name) release")
    }
    
}
*/
/*
// init and deinit test
func test() {
    let s1 = NamedShape(name: "Test1")  // 要帶 "name"，要不然會報錯
    let s2 = NamedShape(name: "Test2")

    s1.numberOfSides = 10
    s2.numberOfSides = 20

    print(s1.simpleDescription())
    print(s2.simpleDescription())
}
test()
*/

/*
// inheritance and polymorphism
class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        
        self.numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A \(name) with sides of length \(sideLength)."
    }
    
}


let testSqaure = Square(sideLength: 5.2, name: "my test square")
print(testSqaure.area())
print(testSqaure.simpleDescription())
*/

/*
// getter and setter
class EquilateralTriangle: NamedShape {
    
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return Double(numberOfSides) * sideLength
        }
        set {
            print("Got \(newValue)")
            sideLength = newValue / Double(numberOfSides)
        }
    }
    
    override func simpleDescription() -> String {
        return "A \(name) with side of length \(sideLength) and perimeter \(perimeter)"
    }
}

let triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")

print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.perimeter)
*/

/*
// Property Observers
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        
        willSet {
            print("triangle willSet \(newValue.sideLength)")
            square.sideLength = newValue.sideLength
        }
        
        didSet {
            print("triangle didSet \(oldValue.sideLength)")
        }
    }
    
    var square: Square {
        
        willSet {
            print("square willSet \(newValue.sideLength)")
            triangle.sideLength = newValue.sideLength
        }
        
        didSet {
            print("square didSet \(oldValue.sideLength)")
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
    
}

let triangleAndSquare = TriangleAndSquare(size: 10.0, name: "another test shape")

print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)

print("start set square")
triangleAndSquare.square = Square(sideLength: 50.0, name: "larger square")
print("end set square")
print(triangleAndSquare.triangle.sideLength)
*/

// MARK: Enumeration
/*
enum Rank: Int {
    case Ace = 1
    
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    
    case Jack, Queen, King
    
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

let jack = Rank.Jack
print(jack.rawValue)

func RankFromRaw(raw: Int) {
    if let rank = Rank(rawValue: raw) {
        print(rank.simpleDescription())
    }
    else {
        print("not Match")
    }
}

RankFromRaw(1)
RankFromRaw(14)

enum Suit {
    
    case Spades, Hearts, Diamonds, Clubs
    
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
            
        case .Hearts:
            return "hearts"
            
        case .Diamonds:
            return "diamonds"
            
        case .Clubs:
            return "clubs"
        }
    }
    
    func color() -> String {
        switch self {
        case .Spades, .Clubs:
            return "black"
        case .Hearts, .Diamonds:
            return "red"
        }
    }
}

enum ServerResponse {
    case Result(String, String)
    case Error(String)
}

let success = ServerResponse.Result("6:00 AM", "8:09 PM")
let failure = ServerResponse.Error("Out of cheese.")

switch success {
    
case let .Result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset)")
    
case let .Error(error):
    print("Failure...\(error)")
    
}

// MARK: Structure

struct Card {
    let rank: Rank
    let suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.color()) \(suit.simpleDescription())"
    }
}

let treeOfSpades = Card(rank: .Three, suit: .Spades)

print(treeOfSpades.simpleDescription())
*/

// MARK: Protocol

protocol ExampleProtocol {
    var simpleDescription: String { get }
    
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription = "A very simple class."
    
    var anotherProperty: Int = 69105
    
    func adjust() {
        simpleDescription += " Now 100% adjusted"
    }
}

let a = SimpleClass()
a.adjust()
print(a.simpleDescription)

struct SimpleStructure: ExampleProtocol {
    
    var simpleDescription = "A very simple structure."
    
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}

var b = SimpleStructure()
b.adjust()
print(b.simpleDescription)

// MARK: Extension

extension Double {
    func abs() -> Double {
        if self < 0 {
            return -self
        }
        else {
            return self
        }
    }
}

let testDouble = -10.0
print(testDouble)
print(testDouble.abs())

extension Int: ExampleProtocol {
    
    var simpleDescription: String {
        return "The number \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
}

var seven: Int = 7

print(seven.simpleDescription)
seven.adjust()
print(seven.simpleDescription)

