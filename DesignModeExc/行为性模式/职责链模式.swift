//
//  职责链模式.swift
//  DesignModeExc
//
//  Created by 安亚 on 2022/7/21.
//

import Foundation

//处理者（Handler）
protocol DispenseProtocol {
    // 计算转化的面值
    func dispense(amout: Int)
}

// 具体处理者（Concrete Handler）
class DispenseChainNode: DispenseProtocol {
 
    // 下一个责任链
    var _nextChainUnit: DispenseChainNode?
    // 面值
    var _dispenseValue: Int
    
    init(value: Int) {
        _dispenseValue = value
    }
    
    func setNext(nextChain: DispenseChainNode) {
        _nextChainUnit = nextChain
    }
    
    func dispense(amout: Int) {
        
        if amout >= _dispenseValue {
            
            let count = amout / _dispenseValue
            let remainder = amout % _dispenseValue
            print("Dispensing \(count) of \(_dispenseValue)")
            
            if remainder != 0 {
                _nextChainUnit?.dispense(amout: remainder)
            }
        } else {
            _nextChainUnit?.dispense(amout: amout)
        }
    }
}

class ATMDispenseChain: DispenseProtocol {
    
    var _firstChainNode: DispenseChainNode?
    var _lastChainNode: DispenseChainNode?
    var _minimunValue: Int?
    
    init(nodeValues: Array<Int>) {
        
        let length = nodeValues.count
        
        for (idx, item) in nodeValues.enumerated() {
            
            if idx == length - 1 {
                _minimunValue = item
            }

            let itemNode = DispenseChainNode(value: item)
            
            if _firstChainNode == nil {
                _firstChainNode = itemNode
                _lastChainNode = itemNode
            } else {
                /// 这就是链表结构
                _lastChainNode?.setNext(nextChain: itemNode)
                _lastChainNode = itemNode
            }
        }
    }
    
    func dispense(amout: Int) {
        guard let min = _minimunValue else {
            return
        }
        
        if amout % min != 0 {
            print("Amount should be in multiple of \(min)")
            return
        }
        
        _firstChainNode?.dispense(amout: amout)
    }
}

class Client_reponse {
    
    static func dispenseMoney() {
        let arr = [100, 50, 20, 10, 5]
        
        let atmDispenseNode = ATMDispenseChain(nodeValues: arr)
        print("\n")
        
        atmDispenseNode.dispense(amout: 230)
        print("\n")

        atmDispenseNode.dispense(amout: 345)
        print("\n")

        atmDispenseNode.dispense(amout: 57)
    }
    
}


