//
//  Notification.swift
//  iCare
//
//  Created by Carl He on 4/29/20.
//  Copyright © 2020 Carl He. All rights reserved.
//

import Foundation
import UserNotifications

func set_Next_Notification(nextNotificationInterval:Double){
    // request permission
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {_,_ in })
        //set notification
    let content = UNMutableNotificationContent()
    content.title = "Enter New Records"
    content.subtitle = "Temp Temp Temp"
    content.sound = UNNotificationSound.default
    
    let open = UNNotificationAction(identifier: "open", title: "Open", options:.foreground)
    
    let cancel = UNNotificationAction(identifier: "cancel", title: "Cancel", options:.destructive)
    
    let categories = UNNotificationCategory(identifier: "action", actions: [open,cancel], intentIdentifiers: [])
    
    UNUserNotificationCenter.current().setNotificationCategories([categories])
    
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(nextNotificationInterval*60), repeats: false)
    
    let request = UNNotificationRequest(identifier: String(nextNotificationInterval), content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        //push notification to a Local store
}
