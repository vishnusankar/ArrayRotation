//
//  ArrayRotationHelper.swift
//  ArrayRotation
//
//  Created by vishnusankar on 25/05/18.
//  Copyright © 2018 vishnusankar. All rights reserved.
//

import Foundation

class ArrayRotationHelper {
    func leftRotation(array : inout [Int], d : Int) {
        
        let arrayCount : Int = array.count
        let gcdValue = gcdSimplifiedVersion(valueOne: arrayCount, valueTwo: d)
        
        for i in 0..<Int(gcdValue) {
            let temp = array[Int(i)]
            var j : Int = i
            while (true) {
                
                if (j + d) >= Int(arrayCount) {
                    break
                }
                
                array[j] = array[j+Int(d)]
                j += Int(d)
            }
            array[j] = temp
        }
    }
    
    func gcdSimplifiedVersion(valueOne : Int, valueTwo : Int) -> Int {
        print("\(valueOne) - \(valueTwo)")
        if valueTwo == 0 {
            return valueOne
        }
        else {
            return gcdSimplifiedVersion(valueOne: valueTwo, valueTwo: valueOne % valueTwo)
        }
    }
    
    func lcm(valueOne : Int, valueTwo : Int) -> Int {
        return (valueOne * valueTwo) / gcdSimplifiedVersion(valueOne: valueOne, valueTwo: valueTwo)
    }
    
    // Time Complexity is O(logn)
    func gcd(valueOne : Int, valueTwo : Int) -> Int {
        
        if valueOne == 0 {
            return valueTwo
        }else if valueTwo == 0 {
            return valueOne
        }
        
        var higherValue : Int = 0
        var lowerValue : Int = 0
        
        if valueOne > valueTwo {
            higherValue = valueOne
            lowerValue = valueTwo
        }else {
            higherValue = valueTwo
            lowerValue = valueOne
        }
        
        
        let quantient = higherValue / lowerValue
        let reminder = higherValue % lowerValue
        
        if reminder >= 0 {
            return gcd(valueOne: lowerValue, valueTwo: reminder)
        }else {
            return quantient
        }
    }
}
