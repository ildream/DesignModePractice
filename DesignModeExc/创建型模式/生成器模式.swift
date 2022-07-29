//
//  生成器模式.swift
//  DesignModeExc
//
//  Created by 安亚 on 2022/7/20.
//

import Foundation

/**
    生成器模式：
    也叫创建者模式，它将一个复杂对象的构建与它的表示分离，使得同样的构建过程可以创建不同的表示。
 
成员角色：
    抽象建造者：定义构造产品的几个公共方法。
    具体建造者：根据不同的需求来实现抽象建造者定义的公共方法；每一个具体建造者都包含一个产品对象作为它的成员变量。
    指挥者：根据传入的具体建造者来返回其所对应的产品对象
    产品角色：创建的产品。
 */

class Phone1 {
    
    var cpu: String?
    var display: String?
    var capacity: String?
    var camera: String?

    init() {
        
    }
    
    func desc() -> String {
        "cpu = " + cpu! + " display = " + display! + " capacity = " + capacity! + " camera = " + camera!
    }
}

protocol Builder {
     var phone: Phone1? { get set }
     
    func createPhone()
    func buildCPU()
    func buildCapacity()
    func buildDisplay()
    func buildCamera()
    
    func obtainPhone() -> Phone1
}


class IphoneXRBuild: Builder {
    
    init() {
        createPhone()
    }
    
    var phone: Phone1?
    
    func createPhone() {
        phone = Phone1();
    }
    
    func buildCPU() {
        phone?.cpu = "A12"
    }
    
    func buildCapacity() {
        phone?.capacity = "512"
    }
    
    func buildDisplay() {
        phone?.display = "6.1"
    }
    
    func buildCamera() {
        phone?.camera = "12MP"
    }
    
    func obtainPhone() -> Phone1 {
        phone!
    }
}

class Mi8Build: Builder {
    
    init() {
        createPhone()
    }
    
    var phone: Phone1?
    
    func createPhone() {
        phone = Phone1()
    }
    
    func buildCPU() {
        phone?.cpu = "Snapdragon 845"
    }
    
    func buildDisplay() {
        phone?.display = "6.21"
    }
    
    func buildCapacity() {
        phone?.capacity = "256"
    }
    
    func buildCamera() {
        phone?.camera = "24Mp"
    }
    
    func obtainPhone() -> Phone1 {
        phone!
    }
}

class Director {
    
    private var _builder: Builder?
    
    func constructPhone(with builder: Builder) {
        _builder = builder
        
        builder.buildCPU()
        builder.buildCapacity()
        builder.buildDisplay()
        builder.buildCamera()
    }
    
    func obtainPhone() -> Phone1 {
        (_builder?.obtainPhone())!
    }
    
}
