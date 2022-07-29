//
//  ViewController.swift
//  DesignModeExc
//
//  Created by 安亚 on 2022/7/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        simpleFactory()
        factory()
        absFactory()
        singleton()
        builderPhone()
        copyPattern()
         */
        
        /*
        qiJieMode()
        proxyMode()
        decoratorMode()
        */
        
        mbMode()
        strategyMode()
        reponseMode()
        stateMode()
        commandMode()
        observerMode()
        mediatorMode()
        iteratorMode()
        mementoMode()
    }
}

/// 创建型Demo
extension ViewController {
    
    func simpleFactory() {
        print("--------simpleFacotry---------\n")

        /// 可口可乐
        let cocaCola = SimpleFactory.creatCola(with: 0)
        print(cocaCola.desc() + "\n")
        
        /// 百世可乐
        let pesiCola = SimpleFactory.creatCola(with: 1)
        print(pesiCola.desc() + "\n")
    }
    
    func factory() {
        print("--------factory---------\n")
        /// 可口可乐
        let cocaCola = CocaColaFactory.createCola()
        print(cocaCola.desc() + "\n")

        /// 百世可乐
        let pesiCola = PesiColaFactory.createCola()
        print(pesiCola.desc() + "\n")
    }
    
    func absFactory() {
        print("--------absFactory---------\n")
        
        let appleCompute = AppFactory.createComputer()
        let iPhone = AppFactory.createPhone()
        let pad = AppFactory.createPad()
        print(appleCompute.desc() + "\n")
        print(iPhone.desc() + "\n")
        print(pad.desc() + "\n")

        
        let miComputer = MiFactory.createComputer()
        let miPhone = MiFactory.createPhone()
        let miPad = MiFactory.createPad()
        print(miComputer.desc() + "\n")
        print(miPhone.desc() + "\n")
        print(miPad.desc() + "\n")
    }
    
    func singleton() {
        print("--------absFactory---------\n")

        let shared = Singleton.shared
        shared.appId = "19901129"
        print("appId =", shared.appId!)
    }
    
    func builderPhone() {
        print("--------absFactory---------\n")

        let iPhoneBuild = IphoneXRBuild()
        
        let director = Director()
        director.constructPhone(with: iPhoneBuild)
        let xrPhone = director.obtainPhone()
        print(xrPhone.desc())
        
        let miPhoneBuild = Mi8Build()
        
        director.constructPhone(with: miPhoneBuild)
        let mi8Phone = director.obtainPhone()
        print(mi8Phone.desc())
    }
    
    func copyPattern() {
        print("--------copyPattern---------\n")

        let university = UniversityInfo()
        university.universityName = "清华大学"
        university.startYear = "2021 - 10 - 01"
        university.endYear = "2021 - 11- 11"
        university.major = "哲学"
        
        let copyUni = university.copy(with: nil) as? UniversityInfo
        
        print(university.description + "\n")
        print(copyUni!.description)

    }
    
}

extension ViewController {
    
    // 桥接模式
    func qiJieMode() {
        Client_QJ.qjMode()
    }
    
    // 代理模式
    func proxyMode() {
        Client_Proxy.buyHouse()
    }
    
    func decoratorMode() {
        Client_dtr.decoratorMode()
    }
}

extension ViewController {
    
    func mbMode() {
        Client_MbMode.makingHotDrinkMbMode()
    }
    
    func strategyMode() {
        Client_strategy.vipStrategy()
    }
    
    func reponseMode() {
        Client_reponse.dispenseMoney()
    }
    
    func stateMode() {
        Client_state.accountOperate()
    }
    
    func commandMode() {
        Client_command.controlLight()
    }
    
    func observerMode() {
        Client_Observer.stockPriceObserver()
    }
    
    func mediatorMode() {
        Client_Mediator.groupChat()
    }
    
    func iteratorMode() {
        Client_iterator.listIterator()
    }
    
    func mementoMode() {
        Client_bwl.playRole()
    }
}

