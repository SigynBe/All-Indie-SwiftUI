//
//  NotificationViewModel.swift
//  All-Indie-SwiftUI
//
//  Created by Gonzalo Ivan Santos Portales on 28/01/21.
//

import Foundation

class NotificationViewModel : ObservableObject {
    
    @Published var notificationService : UserNotificationService
    @Published var notificationViewIsOpen = false
    @Published var date = Date()
    @Published var weekDays : [Day] = []
        
    init(notificationService : UserNotificationService) {
        self.notificationService = notificationService
        self.getNotificationsDaysHoursAndMinutes()
    }
    
    func changeDayState(on index : Int) {
        weekDays[index].isSelected = !weekDays[index].isSelected
    }
    
    func changeNotificationViewState() {
        DispatchQueue.main.async {
            self.notificationViewIsOpen = !self.notificationViewIsOpen
        }
    }
    
    func getNotificationsDaysHoursAndMinutes() {
        notificationService.getNotificationsDaysHourMinute { (days, hour, minutes) in
            var auxWeekDays : [Day] = self.getWeekDays()
            
            for day in days {
                auxWeekDays[day].isSelected = true
            }
            
            DispatchQueue.main.async {
                self.weekDays = auxWeekDays
            }
        }
    }
    
    func setNotification(onHour hour : Int, andMinute minute : Int) {
        var selectedDaysIndex : [Int] = []
        for day in weekDays {
            if day.isSelected {
                selectedDaysIndex.append(day.index)
            }
        }
        
        // tem que de alguma forma pegar a hora e minuto do date e enviar pra essa função aqui
        self.notificationService.setUserNotification(weekDays : selectedDaysIndex, hour : hour, minute: minute)
    }
    
    private func getWeekDays() -> [Day] {
        /* Esse aqui é o certo, só n to usando pq n dá pra testar
         let weekDaysSymbols = Locale.current.calendar.veryShortWeekdaySymbols
        
        var auxWeekDays : [Day] = []
        var index = 0
        for symbol in weekDaysSymbols {
            auxWeekDays.append(.init(daySymbol: symbol, isSelected : false, index : index))
            index += 1
        }
        
        return auxWeekDays*/
        
        return [.init(daySymbol:"D", isSelected: false, index: 0),.init(daySymbol:"S", isSelected: false, index: 1),.init(daySymbol:"T", isSelected: false, index: 2),.init(daySymbol:"Q", isSelected: false, index: 3),.init(daySymbol: "Q", isSelected: false, index: 4),.init(daySymbol:"S", isSelected: false, index: 5),.init(daySymbol:"D", isSelected: false, index: 6)]
    }
}
