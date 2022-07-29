//
//  命令模式.swift
//  DesignModeExc
//
//  Created by 安亚 on 2022/7/22.
//

import Foundation

// receiver
class Light {
    
    func lightOn() {
        print("light on")
    }
    
    func lightOff() {
        print("light off")
    }
    
}

// abstract Command
protocol Command {
    
    var light: Light?{ set get }
    
    func excute()
    
}

class CommandLightOn: Command {
    
    var light: Light?
    
    init(lt: Light) {
        light = lt
    }
    
    func excute() {
        light?.lightOn()
    }
    
}

class CommandLightOff: Command {
    
    var light: Light?
    
    init(lt: Light) {
        light = lt
    }
    
    func excute() {
        light?.lightOff()
    }
}

class RemoteControl {
    
    private var _command: Command?
    
    func setCommand(command: Command) {
        _command = command
    }
    
    func pressButton() {
        _command?.excute()
    }
}

class Client_command {
    
    //更新
    static func controlLight() {
    
        print("\n")
        let remotecontrol = RemoteControl()
        let light = Light()
        let lightOnCommand = CommandLightOn(lt: light)
        let lightOffCommand = CommandLightOff(lt: light)

        // 遥控器，调用者，把命令传给receiver
        remotecontrol.setCommand(command: lightOnCommand)
        remotecontrol.pressButton()
        
        remotecontrol.setCommand(command: lightOffCommand)
        remotecontrol.pressButton()
    }
}
