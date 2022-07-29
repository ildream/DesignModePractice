//
//  模板方法模式.swift
//  DesignModeExc
//
//  Created by 安亚 on 2022/7/21.
//

import Foundation


class HotDrink {

    func makingProcess() {
        prepareHotWater()
        addMainMaterial()
        addIngredients()
    }
    
    func addMainMaterial() {
        print("implemetation by subClasses")
    }
    
    func addIngredients() {
        print("implemetation by subClasses")
    }
    
    // 这一步的算法不暴露给子类
    private func prepareHotWater() {
        print("prepare hot water")
    }
}

// 热茶
class HotDrinkTea: HotDrink {
    
    override func addMainMaterial() {
        print("add tea leaf")
    }
    
    override func addIngredients() {
        print("add nothing")
    }
}

// 热拿铁
class HotDrinkLatte: HotDrink {
    
    override func addMainMaterial() {
        print("add ground coffee")
    }
    
    override func addIngredients() {
        print("add milk")
    }
    
}

// 热美式
class HotDrinkAmericano: HotDrink {
    override func addMainMaterial() {
        print("add ground coffee")
    }
    
    override func addIngredients() {
        print("add nothing")
    }
}

class Client_MbMode {
    
    static func makingHotDrinkMbMode() {
        
        let hotTea = HotDrinkTea()
        hotTea.makingProcess()
        print("\n")
        
        let hotLatte = HotDrinkLatte()
        hotLatte.makingProcess()
        print("\n")

        let hotAmericano = HotDrinkAmericano()
        hotAmericano.makingProcess()
        print("\n")

    }
    
}

