//
//  main.swift
//  DartGame
//
//  Created by Kay on 2022/06/10.
//

import Foundation

private func powerOfCalculation(_ base: Int, _ exponent: Int ) -> Int {
    return Int(pow(Double(base),Double(exponent)))
}

private func parse(_ myString: String) -> [String] {
    var parsed_String_Array: [String] = []
    var temp_Score_String: String = ""
    var temp_Bonus_String: String = ""
    for element in myString {
        if 48 <= element.asciiValue! && element.asciiValue! <= 57 {
            if !temp_Bonus_String.isEmpty {
                parsed_String_Array.append(temp_Bonus_String)
                temp_Bonus_String.removeAll()
            }
            temp_Score_String.append(element)
        } else {
            if !temp_Score_String.isEmpty {
                parsed_String_Array.append(temp_Score_String)
                temp_Score_String.removeAll()
            }
            temp_Bonus_String.append(element)
        }
    }
    parsed_String_Array.append(temp_Bonus_String)
    return parsed_String_Array
}

private func bonus_Calculation(_ old_Number: Int, _ current_Number: Int,_ bonus_String: String) -> (Int,Int) {
    var old_result: Int = old_Number
    var current_result: Int = current_Number
    switch bonus_String {
    case "S" :
        current_result = powerOfCalculation(current_Number,1)
    case "D" :
        current_result = powerOfCalculation(current_Number,2)
    case "T" :
        current_result = powerOfCalculation(current_Number,3)
    case "S*" :
        old_result = old_result * 2
        current_result = powerOfCalculation(current_Number, 1) * 2
    case "D*" :
        old_result = old_result * 2
        current_result = powerOfCalculation(current_Number, 2) * 2
    case "T*" :
        old_result = old_result * 2
        current_result = powerOfCalculation(current_Number, 3) * 2
    case "S#" :
        current_result = powerOfCalculation(current_Number, 1) * -1
    case "D#" :
        current_result = powerOfCalculation(current_Number, 2) * -1
    case "T#" :
        current_result = powerOfCalculation(current_Number, 3) * -1
    default:
        current_result = -99
    }
    
    return (old_result, current_result)
}

func solution(_ dartResult:String) -> Int {
    let parsed_String_Array = parse(dartResult)
    
    var first_Number: Int = Int(parsed_String_Array[0])!
    var second_Number: Int = Int(parsed_String_Array[2])!
    var third_Number: Int = Int(parsed_String_Array[4])!
    
    let first_Bonus = parsed_String_Array[1]
    let second_Bonus = parsed_String_Array[3]
    let third_Bonus = parsed_String_Array[5]
    
    let result1 = bonus_Calculation(0, first_Number, first_Bonus)
    first_Number = result1.1
    
    let result2 = bonus_Calculation(first_Number, second_Number, second_Bonus)
    first_Number = result2.0
    second_Number = result2.1
    
    let result3 = bonus_Calculation(second_Number, third_Number, third_Bonus)
    second_Number = result3.0
    third_Number = result3.1
    
    return first_Number + second_Number + third_Number
}
