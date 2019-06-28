//
//  Friends_Extension.swift
//  Friends_Extension
//
//  Created by gongpengyang on 2019/6/28.
//  Copyright © 2019 kaiyuan. All rights reserved.
//


import CTMediator

public extension CTMediator {
    @objc public func Friends_Extension(callback:@escaping (String) -> Void) -> UIViewController? {
        let params = [
            "callback":callback,
            kCTMediatorParamsKeySwiftTargetModuleName:"Friends"
            ] as [AnyHashable : Any]
        if let viewController = self.performTarget("Friends", action: "Extension_ViewController", params: params, shouldCacheTarget: false) as? UIViewController {
            return viewController
        }
        return nil
    }
    
    @objc public func A_showObjc(callback:@escaping (String) -> Void) -> UIViewController? {
        let callbackBlock = callback as @convention(block) (String) -> Void
        let callbackBlockObject = unsafeBitCast(callbackBlock, to: AnyObject.self)
        let params = ["callback":callbackBlockObject] as [AnyHashable:Any]
        if let viewController = self.performTarget("Friends", action: "Extension_ViewController", params: params, shouldCacheTarget: false) as? UIViewController {
            return viewController
        }
        return nil
    }
}
