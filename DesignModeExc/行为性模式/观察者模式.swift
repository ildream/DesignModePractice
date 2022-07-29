//
//  观察者模式.swift
//  DesignModeExc
//
//  Created by 安亚 on 2022/7/22.
//

import Foundation

// 订阅者
class Subscriber{
    
    // 更新
    func update(newPrice: Double) {
        
    }
}

class Inverstor: Subscriber {
    
    override func update(newPrice: Double) {
        print("investor \(self) buy stock of price: \(newPrice)")
    }
}

// 发布者
class Publisher {
    
    var _buyingPrice: Double?
    
    private var subscribers: NSMutableArray? = {
        let mArr = NSMutableArray()
        return mArr
    }()
    
    /// 添加订阅者
    func add(sub: Subscriber) {
        subscribers?.add(sub)
    }
    
    /// 移除订阅者
    func remove(sub: Subscriber) {
        subscribers?.remove(sub)
    }
    
    /// 发布给订阅者
    private func publish() {
        for subscriber in subscribers ?? [] {
            (subscriber as? Subscriber)?.update(newPrice: _buyingPrice!)
        }
    }
    
    func setBuyingPrice(price: Double) {
        _buyingPrice = price
        publish()
    }
    
    func getBuyingPrice() -> Double {
        return _buyingPrice!
    }
}

class FinancialAdviser: Publisher {}


class Client_Observer {
    
    static func stockPriceObserver() {
        
        let fa = FinancialAdviser()
        let iv1 = Inverstor()
        fa.add(sub: iv1)
        fa.setBuyingPrice(price: 1.3)
        
        print(" --------- first advice ---------")

        let v2 = Inverstor()
        let v3 = Inverstor()
        fa.add(sub: v2)
        fa.add(sub: v3)
        fa.setBuyingPrice(price: 2.6)
        
        print("----------- second advice ---------")
    }
}

