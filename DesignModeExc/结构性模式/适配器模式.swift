//
//  适配器模式.swift
//  DesignModeExc
//
//  Created by 安亚 on 2022/7/20.
//

import Foundation

protocol OldCacheProtocol {
    
    // 设置缓存
    func old_saveCache(object: Any, key: String)
    
    /// 获取缓存
    func old_getCacheObject(key: String) -> Any?
}

class oldCache: OldCacheProtocol {
    
    func old_saveCache(object: Any, key: String) {
        print("saved cache by old cache object")
    }
    
    func old_getCacheObject(key: String) -> Any? {
        let obj = "get cache by old cache object"
        print(obj)
        return obj
    }
}

// 使用了Adapter仅仅只是增加了一个方法，其他的东西都没有改变。
class Client {
    
    var cache: OldCacheProtocol?
    init() {
        
    }
    
    // 使用老的缓存
    func useOldCache() {
        cache = oldCache();
    }
    
    // 使用新的缓存
    func useNewCache() {
        cache = Adaptor(newCache: NewCache())
    }
    
    // 使用cache对象
    func save(object: Any, for key: String) {
        cache?.old_saveCache(object: object, key: key)
    }
}


class Adaptor: OldCacheProtocol {

    var _newCache: NewCache
    
    init(newCache: NewCache) {
        _newCache = newCache
    }
    
    func old_saveCache(object: Any, key: String) {
        _newCache.new_saveCache(object: object, key: key)
    }
    
    func old_getCacheObject(key: String) -> Any? {
        _newCache.new_getCacheObject(key:key)
    }
}

protocol NewCacheProtocol {
    // 设置缓存
    func new_saveCache(object: Any, key: String)
    
    /// 获取缓存
    func new_getCacheObject(key: String) -> Any?
}

// adaptee 被适配者
class NewCache: NewCacheProtocol {
    
    func new_saveCache(object: Any, key: String) {
        print("saved cache by new cache object")
    }
    
    func new_getCacheObject(key: String) -> Any? {
        let obj = "get cache by new cache object"
        print(obj)
        return obj
    }
}
