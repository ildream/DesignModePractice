//
//  迭代器模式.swift
//  DesignModeExc
//
//  Created by 安亚 on 2022/7/22.
//

import Foundation

protocol Iterator {
    
    associatedtype T
    
    func hasNext() -> Bool
    func next() -> T?
}

protocol Contains {
    associatedtype T
    
    func iterator() -> ConcreteIterator<T>
    func add(_ element: T)
    func remove(_ element: T)
    
}

class ConcreteIterator<T>: Iterator {

    var index = 0
    var _list:Array<T>
    
    init(list: Array<T>) {
        _list = list
    }
    
    func hasNext() -> Bool {
        index != _list.count
    }
    
    func next() -> T? {
        if hasNext() {
            let obj = _list[index]
            index += 1
            return obj
        }
        return nil
    }
}

class ConcreteContains<T>: Contains {
    
    private var list:Array<T> = []
    
    func iterator() -> ConcreteIterator<T> {
        ConcreteIterator<T>(list: list)
    }
    
    func add(_ element: T) {
        list.append(element)
    }
    
    func remove(_ element: T) {
        list.removeLast()
    }
}

class Client_iterator {
    
    static func listIterator() {
        
        let concreteContain = ConcreteContains<Int>()
        concreteContain.add(3)
        concreteContain.add(9)
        concreteContain.add(19)
        
        let iterator = concreteContain.iterator()
        
        while iterator.hasNext() {
            print("item = \(String(describing: iterator.next()))")
        }
    }
}
