//
//  main.swift
//  2018KakaoBlind
//
//  Created by Kay on 2022/06/10.
//
import Foundation

func solution(_ n: Int, _ arr1: [Int], _ arr2: [Int]) -> [String] {
    var answer: [String] = []
    var stringArr1: [[String]] = []
    var stringArr2: [[String]] = []
    arr1.forEach { stringArr1.append(makeBinary($0, n)) }
    arr2.forEach { stringArr2.append(makeBinary($0, n)) }
    for i in 0..<n {
        answer.append(checkEachBit(stringArr1: stringArr1[i], stringArr2: stringArr2[i], count: n))
    }
    return answer
}

func makeBinary(_ num: Int, _ count: Int) -> [String] {
    var result: String = ""
    var resultArray: [String] = []
    var temp: Int = num
    while temp > 0 {
        if temp % 2 == 0 {
            result += "0"
            temp /= 2
        } else {
            result += "1"
            temp /= 2
        }
    }
    while count != result.count {
        result += "0"
    }
    result = String(result.reversed())
    result.forEach { resultArray.append( String.init($0)) }
    return resultArray
}

func checkEachBit(stringArr1: [String], stringArr2: [String], count: Int) -> String {
    var resultString: String = ""
    for i in 0..<count {
        if  stringArr1[i] == "1" || stringArr2[i] == "1" {
            resultString += "#"
        } else {
            resultString += " "
        }
    }
    return resultString
}
print(solution(5, [9,20,28,18,11],[30,1,21,17,28]))
