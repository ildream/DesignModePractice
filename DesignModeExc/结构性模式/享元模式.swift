//
//  享元模式.swift
//  DesignModeExc
//
//  Created by 安亚 on 2022/7/21.
//

import Foundation
import UIKit

enum FlowerType: Int {
    case kAnemone = 0
    case kCosmos
    case kGerberas
    case kHollyhoccase
    case kJasmine
    case kZinnia
    case all
}

class FlowerFactory {
    
    private var _flowersPool: Dictionary<Int, UIImage>?
    
    func flowerImage(type: FlowerType) -> FlowerImageView {
        
        // 判断有没有，如果没有新建，如果有有了，则直接返回
        if (_flowersPool?.keys.contains(type.rawValue)) ?? false { // 已经存在直接使用
            
            let img = _flowersPool?[type.rawValue] ?? UIImage();
            return getFlowerImage(img:img)
            
        } else { // 不存在则创建并且存储
            
            let img = createFlowerImage(type: type)
            return getFlowerImage(img: img)
            
        }
    }
    
    private func createFlowerImage(type: FlowerType) -> UIImage {
        var image: UIImage?
        
        switch type {
        case .kAnemone:
            image = UIImage(named: "kAnemone")

        case .kCosmos:
            image = UIImage(named: "kAnemone")
            
        case .kGerberas:
            image = UIImage(named: "kAnemone")
            
        case .kHollyhoccase:
            image = UIImage(named: "kAnemone")

        case .kJasmine:
            image = UIImage(named: "kAnemone")

        case .kZinnia:
            image = UIImage(named: "kAnemone")

        default:
            print("传入枚举类有问题")
        }
        // 存入已经创建的值
        _flowersPool?[type.rawValue] = image
        return image!
    }
    
    private func getFlowerImage(img: UIImage) -> FlowerImageView {
        let flowerImgView = FlowerImageView(image: img)
        return flowerImgView
    }
}

class FlowerImageView: UIImageView {

}

class Client_XY {
    
    static func generateFlowers() {
        let flowerFactory = FlowerFactory()

        for _ in 0...500 {
            
            let flowerType = FlowerType(rawValue: Int(arc4random()) % 6)
            guard let type = flowerType else {
                continue
            }
            
            let flowerImageV = flowerFactory.flowerImage(type: type)
            
            // 创建花对象的外部属性值（随机的位置和大小）
            let screenBounds = UIScreen.main.bounds
            
            let x = CGFloat(arc4random() % (UInt32(screenBounds.size.width)))
            let y = CGFloat(arc4random() % (UInt32(screenBounds.size.height)))
            let minSize: UInt32 = 10
            let maxSize: UInt32 = 50
            let size: CGFloat = CGFloat((arc4random() % (maxSize - minSize + 1)) + minSize)

            //将位置和大小赋予花对象
            flowerImageV.frame = CGRect(x: x, y: y, width: size, height: size)
            /// 添加到view上
            /// ---------
        }
    }
}
