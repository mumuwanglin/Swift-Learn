//
//  AppDelegate.swift
//  Day22-3DTouchQuickAction
//
//  Created by 王林 on 2019/6/16.
//  Copyright © 2019 王林. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    enum ShortcutIdentifier: String {
        case First
        case Second
        case Third
        
        init?(fullType: String) {
            guard let last = fullType.components(separatedBy: ".").last else {
                return nil
            }
            self.init(rawValue: last)
        }
        
        var type: String {
            return Bundle.main.bundleIdentifier! + ".\(self.rawValue)"
        }
        
    }
    
    var window: UIWindow?
    var launchedShortcutItem: UIApplicationShortcutItem?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        return true
    }

    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        
        let handledShortCutItem = handleShortCutItem(shortcutItem)
        completionHandler(handledShortCutItem)
        
    }

    func handleShortCutItem(_ shortcutItem: UIApplicationShortcutItem) -> Bool {
        var handled = false
        
        guard let _ = ShortcutIdentifier(fullType: shortcutItem.type) else {
            return false
        }
        
        guard let shortCutType = shortcutItem.type as String? else {
            return false
        }
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        var vc: UIViewController
        
        switch shortCutType {
        case ShortcutIdentifier.First.type:
            vc = storyBoard.instantiateViewController(withIdentifier: "RunVC") as! RunViewController
            handled = true
        case ShortcutIdentifier.Second.type:
            vc = storyBoard.instantiateViewController(withIdentifier: "ScanVC") as! ScanViewController
            handled = true
        case ShortcutIdentifier.Third.type:
            vc = storyBoard.instantiateViewController(withIdentifier: "WiFiVC") as! SwitchWiFiViewController
            handled = true
        default:
            vc = UIViewController()
            break
        }
        
        var presentedVC: UIViewController = window!.rootViewController!
        while presentedVC.presentedViewController != nil {
            presentedVC = presentedVC.presentedViewController!
        }
        if !presentedVC.isMember(of: vc.classForCoder) {
            presentedVC.present(vc, animated: true, completion: nil)
        }
        
        return handled
    }

}

