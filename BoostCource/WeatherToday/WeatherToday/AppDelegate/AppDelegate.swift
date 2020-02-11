//
//  AppDelegate.swift
//  WeatherToday
//
//  Created by 박상욱 on 29/07/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   
   var window: UIWindow?
   
   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
      WeatherData.shared.fetch() // 실행시에 Weather Data Load
      
      return true
   }
   
   func applicationWillResignActive(_ application: UIApplication) {
   }
   
   func applicationDidEnterBackground(_ application: UIApplication) {
   }
   
   func applicationWillEnterForeground(_ application: UIApplication) {
   }
   
   func applicationDidBecomeActive(_ application: UIApplication) {
   }
   
   func applicationWillTerminate(_ application: UIApplication) {
   }
}

