//
//  main.swift
//  2021KakaoIntership
//
//  Created by Kay on 2022/06/09.
//

import Foundation

var numberDictionary: [String:String] = ["zero":"0", "one":"1", "two":"2", "three":"3", "four":"4", "five":"5", "six":"6", "seven":"7", "eight":"8", "nine":"9"]

func solution(s: String) -> Int {
    var tempString: String = ""
    var resultString: String = ""
    for element in s {
        guard let value = element.asciiValue else { return -1 }
        if Int(value) >= 48 && Int(value) <= 57 {
            resultString += String(element)
        } else {
            tempString += String(element)
            if let selected = numberDictionary[tempString] {
                resultString += selected
                tempString.removeAll()
            }
        }
    }
    return Int(resultString)!
}

print(solution(s: "zero1two"))
