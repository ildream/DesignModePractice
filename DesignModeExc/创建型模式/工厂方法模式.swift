//
//  工厂方法模式.swift
//  DesignModeExc
//
//  Created by 安亚 on 2022/7/20.
//

import Foundation

/**
    工厂方法模式：又称工厂模式，工厂父类负责定义创建产品对象的公共接口，工厂子类负责生成具体的产品对象，即通过不同的工厂子类来创建不同的产品对象。
 */

// 工厂抽象方法
class Factory {
    class func createCola() -> Cola {
        Cola()
    }
}

class CocaColaFactory: Factory {
    
    override class func createCola() -> Cola {
        CocaCola()
    }
    
}

class PesiColaFactory: Factory {
    override class func createCola() -> Cola {
        PesiCola()
    }
}


