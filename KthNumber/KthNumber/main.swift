//
//  main.swift
//  KthNumber
//
//  Created by Kay on 2022/06/20.
//

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var resultArray: [Int] = []
    for x in 0...commands.count-1 {
        resultArray.append(retrieveNewNumberFromGivenNumbers(array, commands[x][0], commands[x][1], commands[x][2]))
    }
    return resultArray
}

func retrieveNewNumberFromGivenNumbers(_ array: [Int], _ from: Int, _ to: Int, _ which: Int) -> Int {
    var resultArray: [Int] = []
    for x in from...to {
        resultArray.append(array[x-1])
    }
    resultArray = resultArray.sorted()
    return resultArray[which-1]
}

var test_Array = [1, 5, 2, 6, 3, 7, 4]
var commands = [[2, 5, 3], [4, 4, 1], [1, 7, 3]]
print(solution(test_Array,commands))
