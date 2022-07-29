//
//  简单工厂模式.swift
//  DesignModeExc
//
//  Created by 安亚 on 2022/7/20.
//

import Foundation

// 简单工厂类
class SimpleFactory {
    
    static func creatCola(with type: Int) -> Cola {
        switch type {
        case 0:
           return CocaCola()
        default:
           return PesiCola()
        }
    }
}

