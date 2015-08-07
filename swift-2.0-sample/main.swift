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