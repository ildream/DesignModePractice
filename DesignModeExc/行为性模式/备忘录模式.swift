//
//  备忘录模式.swift
//  DesignModeExc
//
//  Created by 安亚 on 2022/7/22.
//

import Foundation

class Role {
    
    var _bloodFlow: Int
    var _magicPoint: Int
    
    init(bloodFlow: Int, magicPoint: Int) {
        _bloodFlow = bloodFlow
        _magicPoint = magicPoint
    }
    
    func display() {
        print("用户当前状态：")
        print("血量：" + "\(_bloodFlow)" + " 蓝量：" + "\(_magicPoint)")
    }
    
    func saveMemento() -> Memento {
        Memento(bloodFlow: _bloodFlow, magicPoint: _magicPoint)
    }
    
    func restoreMemento(memento: Memento) {
        _bloodFlow = memento._bloodFlow
        _magicPoint = memento._magicPoint
    }
}

// memento  [məˈmentəʊ]
class Memento {
    
    private(set) var _bloodFlow: Int
    private(set) var _magicPoint: Int
    
    init(bloodFlow: Int, magicPoint: Int) {
        _bloodFlow = bloodFlow
        _magicPoint = magicPoint
    }
}

class Caretaker {
    
    private var memento: Memento?
    
    var mementoInfo: Memento? {
        get {
            memento
        }
        set {
            memento = newValue
        }
    }
}

class Client_bwl {
    
    static func playRole() {
        let role = Role(bloodFlow: 100, magicPoint: 100)
        print("\n---------------大战boss之前-------------")
        role.display()

        // 保持进度
        let caretaker = Caretaker()
        caretaker.mementoInfo = role.saveMemento()
        
        role._bloodFlow = 20
        role._magicPoint = 20
        print("---------------大战boss-------------")
        role.display()
        
        // 恢复存档
        role.restoreMemento(memento: caretaker.mementoInfo!)
        print("---------------恢复-------------")
        role.display()
    }
}

