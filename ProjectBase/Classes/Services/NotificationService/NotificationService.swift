//
//  NotificationService.swift
//  ProjectBase
//
//  Created by Hoàng Hải on 10/16/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UserNotifications
import UIKit

class NotificationService: NSObject {
    class func registerNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            print("Permission granted: \(granted)")
            guard granted else { return }
            
            let notificationCategory = UNNotificationCategory(identifier: "1Button", actions: [], intentIdentifiers: [], options: [])
            
            UNUserNotificationCenter.current().setNotificationCategories([notificationCategory])
            getNotificationSettings()
        }
    }
    
    
    class func getNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            guard settings.authorizationStatus == .authorized else { return }
            //NotificationContent Extend có thể không dùng remote
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }
}
