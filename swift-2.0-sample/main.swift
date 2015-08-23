//
//  main.swift
//  swift-2.0-sample
//
//  Created by kigi on 7/30/15.
//  Copyright © 2015 kigi. All rights reserved.
//

import Foundation

/*
// MARK: Type Alias

typealias AudioSample = UInt16

var maxAmplitudeFound = AudioSample.min

print("maxAmplitudeFound = \(maxAmplitudeFound)")
*/

// MARK: Tuple

let http404Error = (404, "Not Found")

let (statusCode, statusMessage) = http404Error

print("statusCode = \(statusCode) and statusMessage = \(statusMessage)")

let (justTheStatusCode, _) = http404Error

print("just the status code = \(statusCode)")

let http200Status = (statusCode: 200, description: "OK")

print("status = \(http200Status.0) and desc = \(http200Status.1)")
print("status = \(http200Status.statusCode) and desc = \(http200Status.description)")