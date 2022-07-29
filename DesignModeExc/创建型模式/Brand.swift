//
//  Brand.swift
//  DesignModeExc
//
//  Created by 安亚 on 2022/7/20.
//

import Foundation

// 电脑抽象类
class Computer {
    func desc() -> String {
        ""
    }
}

class AppleComputer: Computer {
    override func desc() -> String {
        "__AppleComputer"
    }
}

class MiComputer: Computer {
    override func desc() -> String {
        "__MiComputer"
    }
}

// 手机抽象类
class Phone {
    func desc() -> String {
        ""
    }
}

class IPhone: Phone {
    override func desc() -> String {
        "__IPhone"
    }
}

class MiPhone: Phone {
    override func desc() -> String {
        "__MiPhone"
    }
}

// pad抽象类
class Pad {
    func desc() -> String {
        ""
    }
}

class IPad: Pad {
    override func desc() -> String {
        "__IPad"
    }
}

class MiPad: Pad {
    override func desc() -> String {
        "__MiPad"
    }
}

