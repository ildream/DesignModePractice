//
//  桥接模式.swift
//  DesignModeExc
//
//  Created by 安亚 on 2022/7/20.
//

import Foundation
import UIKit

class Shape {
    
    var _color: Color?
    
    func render(color: Color) {
        _color = color
    }
    
    func show() {
        print("show \(Self.self) with \(type(of: _color!))")
    }
}

class Square: Shape {
    
    override func show() {
        super.show()
    }
}

class Rectangle: Shape {
    
    override func show() {
        super.show()
    }
}

class Circle: Shape {
    
    override func show() {
        super.show()
    }
}


class Color {
    
}

class RedColor: Color {
    
}

class GreenColor: Color {
    
}

class BlueColor: Color {
    
}

class Client_QJ {
    
   static func qjMode() {
        
        let rect = Rectangle()
        let square = Square()
        let circle = Circle()

        let green = GreenColor()
        let red = RedColor()
        let blue = BlueColor()
        
        rect.render(color: red)
        rect.show()
        
        rect.render(color: green)
        rect.show()
        
        circle.render(color: blue)
        circle.show()
        
        circle.render(color: green)
        circle.show()
        
        square.render(color: red)
        square.show()
        
        square.render(color: green)
        square.show()
    }
}


