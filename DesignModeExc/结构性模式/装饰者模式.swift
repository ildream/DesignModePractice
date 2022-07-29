//
//  装饰者模式.swift
//  DesignModeExc
//
//  Created by 安亚 on 2022/7/21.
//

import Foundation

// 抽象的构件
protocol SaladProtocol {
    
    func getDescrition() -> String
    func price() -> Double
    func descClass() -> String
}

let priceDesc = " and price is "

// 抽象父类，继承于抽象构件
// decorator  [ˈdekəreɪtə(r)] 室内装修设计师，裱糊匠
class SauceDecorator: SaladProtocol {
    
    var _salad: SaladProtocol?
    
    init(salad: SaladProtocol) {
        _salad = salad
    }
    
    func getDescrition() -> String {
        ""
    }
    
    func price() -> Double {
        0
    }
    
    func descClass() -> String {
        ""
    }
}

// 具体构件

class VegetableSalad: SaladProtocol {
    
    
    func getDescrition() -> String {
        "\(Self.self)"
    }
    
    func price() -> Double {
        5.0
    }
    
    func descClass() -> String {
        getDescrition() + priceDesc + "\(price())"
    }
}

class ChickenSalad: SaladProtocol {
    
    func getDescrition() -> String {
        "\(Self.self)"
    }
    
    func price() -> Double {
        10.0
    }
    
    func descClass() -> String {
        getDescrition() + priceDesc + "\(price())"
    }
}

class BeefSalad: SaladProtocol {
    
    func getDescrition() -> String {
        "\(Self.self)"
    }
    
    func price() -> Double {
        16.0
    }
    
    func descClass() -> String {
        getDescrition() + priceDesc + "\(price())"
    }
}

// 具体装饰
// 醋酱
class VinegarSauceDecorator: SauceDecorator {
    
    override func getDescrition() -> String {
        (_salad?.getDescrition() ?? "") + " vinegar sauce"
    }
       
    override func price() -> Double {
        (_salad?.price() ?? 0) + 2.0
    }
    
    override func descClass() -> String {
        getDescrition() + priceDesc + "\(price())"
    }
}

// 花生酱
class PeanutButterSauceDecorator: SauceDecorator {
    
    override func getDescrition() -> String {
        (_salad?.getDescrition() ?? "") + " PeanutButter sauce"
    }
       
    override func price() -> Double {
        (_salad?.price() ?? 0) + 4.0
    }
    
    override func descClass() -> String {
        getDescrition() + priceDesc + "\(price())"
    }
}

// 蓝莓酱
class BlueBerrySauceDecorator: SauceDecorator {
    
    override func getDescrition() -> String {
        (_salad?.getDescrition() ?? "") + " BlueBerry sauce"
    }
       
    override func price() -> Double {
        (_salad?.price() ?? 0) + 6.0
    }
    
    override func descClass() -> String {
        getDescrition() + priceDesc + "\(price())"
    }
}

// Client  [ˈklaɪənt]
// salad   [ˈsæləd] 撒了的
class Client_dtr {
    
    static func decoratorMode() {
        
        // 第一种搭配 vegetable add vinegar
        var vegetableSalad: SaladProtocol = VegetableSalad()
        print("\n" + vegetableSalad.descClass())
        
        vegetableSalad = VinegarSauceDecorator(salad: vegetableSalad)
        print("\n" + vegetableSalad.descClass())
        
        // 第二种搭配 beef salad add two PeanutButter
        var beefSalad: SaladProtocol = BeefSalad()
        print("\n" + beefSalad.descClass())
        
        beefSalad = PeanutButterSauceDecorator(salad: beefSalad)
        print("\n" + beefSalad.descClass())

        beefSalad = PeanutButterSauceDecorator(salad: beefSalad)
        print("\n" + beefSalad.descClass())
        
        // 第三种搭配：chiken salad add peanut butter sauce and blueberry sauce
        var chikenSalad: SaladProtocol = ChickenSalad()
        print("\n" + chikenSalad.descClass())
        
        chikenSalad = PeanutButterSauceDecorator(salad: chikenSalad)
        print("\n" + chikenSalad.descClass())

        chikenSalad = BlueBerrySauceDecorator(salad: chikenSalad)
        print("\n" + chikenSalad.descClass())
    }
}

