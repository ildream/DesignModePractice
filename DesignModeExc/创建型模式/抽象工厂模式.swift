//
//  抽象工厂模式.swift
//  DesignModeExc
//
//  Created by 安亚 on 2022/7/20.
//

import Foundation
/**
   抽象工厂方法：
   提供一个创建一系列相关或相互依赖对象的接口，而无须指定它们具体的类。
 */

// 产品族：同一个工厂生产的不同产品， 小米手机，小米电脑，小米平板
// 产品等级：同一个产品的不同实现， 手机，有苹果手机，小米手机

class AbsFactory {
    
    class func createPhone() -> Phone {
        Phone()
    }
    
    class func createComputer() -> Computer {
        Computer()
    }
    
    class func createPad() -> Pad {
        Pad()
    }
}

// 苹果工厂
class AppFactory: AbsFactory {
    
    override class func createComputer() -> Computer {
        AppleComputer()
    }
    
    override class func createPhone() -> Phone {
        IPhone()
    }
    
    override class func createPad() -> Pad {
        IPad()
    }
}

// 小米工厂
class MiFactory: AbsFactory {
    
    override class func createComputer() -> Computer {
        MiComputer()
    }
    
    override class func createPhone() -> Phone {
        MiPhone()
    }
    
    override class func createPad() -> Pad {
        MiPad()
    }
}
