//
//  Cola.swift
//  DesignModeExc
//
//  Created by 安亚 on 2022/7/20.
//

import Foundation

// 可口可乐抽象类
class Cola {
    func desc() -> String {
        "Cola 抽象父类"
    }
}

// 可口可乐
class CocaCola: Cola {
    override func desc() -> String {
        "CocaCola 类"
    }
}

// 百世可乐
class PesiCola: Cola {
    override func desc() -> String {
        "PesiCola 类"
    }
}

// 瓶子的抽象类
class Bottle {
    
}

class CocaColaBottle: Bottle {
    
}

class PesiColaBottle: Bottle {
    
}

// 箱子的抽象类
class Box {
    
}

class CocaColaBox: Box {
    
}

class PesiColaBox: Box {
    
}


