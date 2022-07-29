//
//  中介者模式.swift
//  DesignModeExc
//
//  Created by 安亚 on 2022/7/22.
//

import Foundation

protocol ChatMediatorDelegate {
    // 添加消息
    func addUser(user: User)
    // 发送消息
    func sendMessage(message: String, from user: User)
}

class ChatMediator: ChatMediatorDelegate {
    
    private var _userList:Array<User> = {
        let arr = Array<User>()
        return arr
    }()
    
    
    func addUser(user: User) {
        _userList.append(user)
    }
    
    func sendMessage(message: String, from user: User) {
        
        for itemUser in _userList {
            if itemUser !== user {
                itemUser.receivedMessage(message: message)
            }
        }
        
    }
}

class User {
    
    var _name: String
    var _chatMediator: ChatMediator
    
    init(name: String, meditor: ChatMediator) {
        _name = name
        _chatMediator = meditor
    }
    
    func sendMessage(mess: String) {
        print("-----------")
        print("\(_name) send message: \(mess)")
        _chatMediator.sendMessage(message: mess, from: self)
    }
    
    func receivedMessage(message: String) {
        print("\(_name) has received message: \(message)")
    }
}


class Client_Mediator {
    
    static func groupChat() {
       
        let mediator = ChatMediator()
        
        let user1 = User(name: "Jack", meditor: mediator)
        let user2 = User(name: "Lily", meditor: mediator)
        let user3 = User(name: "Lucy", meditor: mediator)
        
        mediator.addUser(user: user1)
        mediator.addUser(user: user2)
        mediator.addUser(user: user3)
        
        print("\n")
        user1.sendMessage(mess: "今天心情好呐")
        user2.sendMessage(mess: "七月快要走到底了")
        user3.sendMessage(mess: "今天的云很蓝很白哦")
    }
}
