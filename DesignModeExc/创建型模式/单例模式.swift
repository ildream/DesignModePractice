//
//  单李模式.swift
//  DesignModeExc
//
//  Created by 安亚 on 2022/7/20.
//

import Foundation

class Singleton {
    
    static let shared = Singleton()
    
    var appId: String?
    
    init() {
        
    }
}
