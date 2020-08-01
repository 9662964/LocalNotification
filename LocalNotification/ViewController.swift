//
//  ViewController.swift
//  LocalNotification
//
//  Created by iljoo Chae on 7/31/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    //1. Ask for permission
    let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound])
        {(granted, error) in
            print("If you want to give permisstion later, please do ...")
        }
    
    //2. Create the notification content
    let content = UNMutableNotificationContent()
    content.title = "Hey I am a notification"
    content.body = "Look at me!"
        
        
    //Create the trigger
        let date = Date().addingTimeInterval(5)
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
    //Create the request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
    
    //Register with notification center
        center.add(request) { (error) in
            //check the error parameter and handle any errors
            
        }
        
    }
}

