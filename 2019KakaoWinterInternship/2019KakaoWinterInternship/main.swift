//
//  main.swift
//  2019KakaoWinterInternship
//
//  Created by Kay on 2022/06/25.
//

import Foundation


extension Int {
    typealias Element = Int
    
}

struct test<Element>: Queue {
    //associatedtype Element
    private var enqueueStack: [Element] = []
    private var dequeueStack: [Element] = []
    
    mutating func enqueue(_ element: Element) {
        enqueueStack.append(element)
    }
    mutating func dequeue() -> Element? {
        
    }
    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    var peek: Element? {
        //return !dequeueStack.isEmpty ?
    }
}
