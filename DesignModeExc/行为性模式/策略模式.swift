//
//  策略模式.swift
//  DesignModeExc
//
//  Created by 安亚 on 2022/7/21.
//

import Foundation

// strategy [ˈstrætədʒi] 策略;计策;行动计划;策划

class VipStrategy {
    
    // vip 折扣
    func getDiscount() -> Double {
        1
    }
    // vip 所需邮费
    func getPostage() -> Double {
        20
    }
    
    // 根据折扣和邮费计算价格
    func calcPrice(price: Double) -> Double {
        let payPrice = price * getDiscount() + getPostage()
        return payPrice
    }
}

class BronzeVip: VipStrategy {
    
    override func getDiscount() -> Double {
        0.9
    }
    
    override func getPostage() -> Double {
        20
    }
}

class GoldVip: VipStrategy {
    
    override func getDiscount() -> Double {
        0.5
    }
    
    override func getPostage() -> Double {
        0
    }
}

class SilverVip: VipStrategy {
    
    override func getDiscount() -> Double {
        0.7
    }
    
    override func getPostage() -> Double {
        10
    }
}

class OnlineShop {
    
    func buyProduct(vip: VipStrategy) {
        let productPrice: Double = 100
        let payPrice = vip.calcPrice(price: productPrice)
        print( "折扣：" + "\(vip.getDiscount())" + " 运费：" + "\(vip.getPostage())" + " 应付款：" + "\(payPrice)")
    }
}

class Client_strategy {
    
    static func vipStrategy() {
        
        let onlineShop = OnlineShop()
        onlineShop.buyProduct(vip: BronzeVip())
        
        let onlineShop2 = OnlineShop()
        onlineShop2.buyProduct(vip: SilverVip())
        
        let onlineShop1 = OnlineShop()
        onlineShop1.buyProduct(vip: GoldVip())
    }
    
}
 

