//
//  外观模式.swift
//  DesignModeExc
//
//  Created by 安亚 on 2022/7/20.
//

import Foundation

/**
    concrete  ˈ [ˈkɒŋkriːt]  n 混凝土 adj 具体的，是在的，有形的
 
      定义：定义可一个高层接口，为子系统中的一组接口提供一个统一的接口。
    使用场景：
        1.子系统随着业务复杂度的提升而变得越来越复杂，客户端需要某些子系统共同协作来完成某个任务
        2.在多层结构的系统中，使用外观对象可以作为每层的入口来简化层间的调用。
 */

class HomeDevice {
    // 连接电源
    func on() {
        
    }
    
    // 关闭电源
    func off() {
        
    }
}



class AirConditioner: HomeDevice {
    
    // 高位模式
    func startHighTemperatureMode() {
        
    }
    
    // 常温模式
    func startMiddleTemperatureMode() {
        
    }
    
    // 低温模式
    func startLowTemperatureMode() {
        
    }
}

class CDPlayer: HomeDevice {
    
    func play() {
        
    }
}

class DVDPlayer: HomeDevice {
    
    func play() {
        
    }
}

// 音箱类
class VoiceBox: HomeDevice {
    
    // 与CDPlayer连接
    func connectCDPlayer(cdPlayer: CDPlayer) {
        
    }
    
    // 与CDPlayer断开连接
    func disconnectCDPlayer(cdPlayer: CDPlayer) {
        
    }
    
    // 与DVDPlayer连接
    func connectDVDPlayer(dvdPlayer: DVDPlayer) {
        
    }
    
    // 与DVDPlayer断开连接
    func disconnectDVDPlayer(dvdPlayer: DVDPlayer) {
        
    }
}

// 投影仪类
class Projecter: HomeDevice {
    
    func connectDVDPlayer(dvdPlayer: DVDPlayer) {
        
    }
    
    func disconnectDVDPlayer(dvdPlayer: DVDPlayer) {
        
    }
}

// 外观类

class HomeDeviceManager {
    
    var airconditioner: AirConditioner?
    var cdPlayer: CDPlayer?
    var dvdPlayer: DVDPlayer?
    var voiceBox: VoiceBox?
    var projecter: Projecter?
    var registerDevices: Array<HomeDevice?>? // 所有注册的家用电器
    
    init() {
        airconditioner = AirConditioner()
        cdPlayer = CDPlayer()
        dvdPlayer = DVDPlayer()
        voiceBox = VoiceBox()
        projecter = Projecter()
        registerDevices = [airconditioner, cdPlayer, dvdPlayer, voiceBox, projecter]
    }
    
    /** 空凋方法 **/
    func coolWind() {
        
        airconditioner?.on()
        airconditioner?.startLowTemperatureMode()
        
    }
    
    func warmWind() {
        
        airconditioner?.on()
        airconditioner?.startHighTemperatureMode()
    }
    
    /** cdplayer **/
    
    func playMusic() {
        
        cdPlayer?.on()
        
        voiceBox?.on()
        
        voiceBox?.connectCDPlayer(cdPlayer: cdPlayer!)
        
        cdPlayer?.play()
    }
    
    func offMusic() {
        
        voiceBox?.disconnectCDPlayer(cdPlayer: cdPlayer!)
        
        voiceBox?.off()
        
        cdPlayer?.off()
    }
    
    /** dvd player **/
    func playMovie() {
        
        dvdPlayer?.on()
        
        voiceBox?.on()
        
        voiceBox?.connectDVDPlayer(dvdPlayer: dvdPlayer!)

        projecter?.on()
        
        projecter?.connectDVDPlayer(dvdPlayer: dvdPlayer!)

        dvdPlayer?.play()
    }
    
    func offMovie() {
        
        voiceBox?.disconnectDVDPlayer(dvdPlayer: dvdPlayer!)
        
        voiceBox?.off()
        
        projecter?.disconnectDVDPlayer(dvdPlayer: dvdPlayer!)

        projecter?.off()
        
        dvdPlayer?.off()
    }
    
    
    // 打开全部家用电器
    func allDeviceOn() {
        
        for item in registerDevices ?? [] {
            item?.on()
        }
    }
    
    // 关闭全部家用电器
    func allDeviceOff() {
        for item in registerDevices ?? [] {
            item?.off()
        }
    }
}
