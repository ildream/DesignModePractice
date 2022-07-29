//
//  原型模式.swift
//  DesignModeExc
//
//  Created by 安亚 on 2022/7/20.
//

import Foundation

/**
 原型模式：
 使用原型实例指定待创建对象的类型，并且通过复制这个原型来创建新的对象。
    
成员：
    抽象原型： 抽象原型类声明克隆自身的接口
    具体原型类：具体原型类实现克隆的具体操作
 */

class UniversityInfo: NSObject, NSCopying {
    
    var universityName: String?
    var startYear: String?
    var endYear: String?
    var major: String?
    
    
    func copy(with zone: NSZone? = nil) -> Any {
        let uni = UniversityInfo()
        uni.universityName = universityName
        uni.startYear = startYear
        uni.endYear = endYear
        uni.major = major
        
        return uni
    }
    
    override var description: String {
        "universityName = " + universityName! + " startYear = " + startYear! + " endYear = " + endYear!
    }
}
