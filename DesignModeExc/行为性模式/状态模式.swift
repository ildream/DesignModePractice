//
//  状态模式.swift
//  DesignModeExc
//
//  Created by 安亚 on 2022/7/22.
//

import Foundation

// 抽象状态类
protocol StateProtocol {

    func saveMoney(money: Double) -> Bool
    func drawMoney(money: Double) -> Bool
    func borrowMoney(money: Double) -> Bool
}

// 具体状态类
class RichState: StateProtocol {
    
    func saveMoney(money: Double) -> Bool {
        print("欢迎存钱 \(money)")
        return true
    }
    
    func drawMoney(money: Double) -> Bool {
        print("欢迎取钱 \(money)")
        return true
    }
    
    func borrowMoney(money: Double) -> Bool {
        print("您还有余额，请先花完余额")
        return false
    }
    
}

class ZeroState: StateProtocol {
    
    func saveMoney(money: Double) -> Bool {
        print("欢迎存钱 \(money)")
        return true
    }
    
    func drawMoney(money: Double) -> Bool {
        print("您当前没有余额")
        return false
    }
    
    func borrowMoney(money: Double) -> Bool {
        print("欢迎借钱 \(money)")
        return true
    }
}

class DebtState: StateProtocol {
    func saveMoney(money: Double) -> Bool {
        print("欢迎存钱 \(money)")
        return true
    }
    
    func drawMoney(money: Double) -> Bool {
        print("您当前没有余额")
        return false
    }
    
    func borrowMoney(money: Double) -> Bool {
        print("上次欠的账还没有还清，暂时无法借钱")
        return false
    }
}

// 环境类
class Account: StateProtocol {
    
    var _state: StateProtocol
    var _money: Double = 0
    
    
    init() {
        _state = ZeroState()
    }
    
    // MARK: --- 状态代理方法
    @discardableResult
    func saveMoney(money: Double) -> Bool {
        if _state.saveMoney(money: money) {
            _money += money
            updateState()
        }
        print("存钱：\(money) 余额：\(_money)")
        return true
    }
    
    @discardableResult
    func drawMoney(money: Double) -> Bool {
        if _state.drawMoney(money: money) {
            _money -= money
            updateState()
            print("取钱：\(money) 余额：\(_money)")
            return true
        }
        return false
    }
    
    @discardableResult
    func borrowMoney(money: Double) -> Bool {
        if _state.borrowMoney(money: money) {
            _money -= money
            updateState()
            print("借钱：\(money) 余额：\(_money)")
            return true
        }
        
        return false
    }
    
    // MARK: --- 私有方法
    private func updateState() {
        if _money > 0 {
            _state = RichState()
        } else if _money == 0 {
            _state = ZeroState()
        } else {
            _state = DebtState()
        }
    }
}

class Client_state {
    
    static func accountOperate() {
        
        let account = Account()
        print("\n")
        account.drawMoney(money: 50)
        account.saveMoney(money: 100)
        account.borrowMoney(money: 100)
        account.drawMoney(money: 100)
        account.borrowMoney(money: 100)
        account.borrowMoney(money: 50)
    }
}


