//
//  AppDelegate.swift
//  WorkoutTimer iOS
//
//  Created by Rodwan on 2020/05/22.
//

import UIKit
import Application

var store: Store? = nil
var loggerMiddleware: LoggerMiddleware? = nil
var timerMiddleware: TimerMiddleware? = nil
var sessionTimerMiddleware: SessionTimerMiddleware? = nil

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        store = Store()
        loggerMiddleware = LoggerMiddleware(store: store!)
        timerMiddleware = TimerMiddleware(store: store!)
        sessionTimerMiddleware = SessionTimerMiddleware(store: store!)
        
//        store!.dispatch(AddTodoAction(name: "Publish Pod", description: "Release fxorders core to private repo"))
//        store!.dispatch(AddTodoAction(name: "ssh to Https", description: "Update pods to use https instead of ssh for distribution"))
        
//        store!.dispatch(AddSessionTimerAction(name: "HIIT Timer", countDown: 5))
//        store!.dispatch(SelectSessionTimerAction(sessionTimer: SessionTimerSelector.sessionTimers(store!.getState()).first!))
//        store!.dispatch(StartTimerAction())
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

