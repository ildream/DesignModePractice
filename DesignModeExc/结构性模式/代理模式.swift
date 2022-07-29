//
//  代理模式.swift
//  DesignModeExc
//
//  Created by 安亚 on 2022/7/21.
//

import Foundation


protocol PaymentInterface {
    func getPayment(money: Double)
}

/**
 * 很多时候被代理者（委托者）可以完全按照自己的方式去做事情，而把一些额外的事情交给代理来做，这样可以保持原有类的功能的纯粹性，符合开闭原则。
 */
class HouseProxy: PaymentInterface {
    
    var houseOwner: HouseOwner?
    let agentFeeRatio = 0.35
    
    init() {
        houseOwner = houseOwn()
    }
    
    func getPayment(money: Double) {
        
        let agentFee = agentFeeRatio * money
        print("\n Proxy get payment :\(agentFee)")
        houseOwner?.getPayment(money: money - agentFee)
    }
    
    func houseOwn() -> HouseOwner {
        if houseOwner == nil {
            houseOwner = HouseOwner()
        }
        return houseOwner!
    }
}

class HouseOwner: PaymentInterface {
    
    func getPayment(money: Double) {
        print("\n House owner get payment : \(money)")
    }
}

// 客户类
class Client_Proxy {
    
    static func buyHouse() {
        let houseProxy = HouseProxy()
        houseProxy.getPayment(money: 100)
    }
}
