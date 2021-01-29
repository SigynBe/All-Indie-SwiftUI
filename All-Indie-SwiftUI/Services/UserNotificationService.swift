//
//  UserNotificationService.swift
//  IndieComics
//
//  Created by Gonzalo Ivan Santos Portales on 15/06/20.
//  Copyright © 2020 Rebeca Pacheco. All rights reserved.
//

import Foundation
import UserNotifications

class UserNotificationService {
    
    let notificationCenter = UNUserNotificationCenter.current() // botar isso pra ser injetado
    
    func setUserNotification(weekDays : [Int?], hour : Int?,minute : Int?) {
        
        let content = UNMutableNotificationContent()
        content.title = "All Indie"
        content.body = "Venha ver a nova recomendação que temos para você!"

        var dateComponents = DateComponents()
        dateComponents.calendar = Calendar.current
        
        for weekDay in weekDays {
            dateComponents.weekday = weekDay
            dateComponents.hour = hour
            dateComponents.minute = minute

            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

            let id = UUID().uuidString

            let request = UNNotificationRequest(identifier: id,
                         content: content, trigger: trigger)
             
            notificationCenter.add(request) { (error) in
                if error != nil {
                 print(error as Any)
                }
            }
        }
    }
    
    func getNotificationsDaysHourMinute(completion: @escaping ([Int],Int,Int) -> ()) {
        var days : [Int] = []
        var hour : Int = 0
        var minute : Int = 0
        
        notificationCenter.getPendingNotificationRequests(completionHandler: { notifications in
            if !notifications.isEmpty {
                for notification in notifications {
                    let trigger = notification.trigger as! UNCalendarNotificationTrigger
                    days.append(trigger.dateComponents.weekday!)
                    hour = trigger.dateComponents.hour!
                    minute = trigger.dateComponents.minute!
                }
            }

            completion(days,hour,minute)
        })
    }
    
    private func getPendingNotifications(completion: @escaping ([UNNotificationRequest]) -> ()) {
        notificationCenter.getPendingNotificationRequests(completionHandler: { notifications in
            completion(notifications)
        })
    }
    
    func removeAllPendingNotifications() {
        notificationCenter.removeAllPendingNotificationRequests()
    }
    
    func askUserNotificationPermission() {
        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("Aceito")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}
