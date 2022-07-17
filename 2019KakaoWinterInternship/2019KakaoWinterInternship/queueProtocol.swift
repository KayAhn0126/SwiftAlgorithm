//
//  queueProtocol.swift
//  2019KakaoWinterInternship
//
//  Created by Kay on 2022/06/25.
//
import Foundation

protocol Queue {
    associatedtype Element
    
    mutating func enqueue(_ element: Element)
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}
