//
//  BusViewModel.swift
//  SUSTechBus WatchKit Extension
//
//  Created by 石文轩 on 2020/6/17.
//  Copyright © 2020 石文轩. All rights reserved.
//

import Foundation

struct BusViewModel {
    let calender = NSCalendar.current
    let dayFormatter = DateFormatter()
    var currentDate = Date()
    let bus = Bus()
        
    init() {
        dayFormatter.dateFormat = "HH:mm"
    }
    
    var isChange: Bool = false
    var changedValue: Bool?
    
    var isOnWeekDay: Bool {
        get {
            if !isChange {
                return !calender.isDateInWeekend(currentDate)
            }
            else {
                return changedValue!
            }
        }
        set {
            self.isChange = true
            self.changedValue = newValue
        }
    }
    
    var currentTime: String {
        dayFormatter.string(from: currentDate)
    }
    
    var XinYuanPrevious: String {
        bus.getXinYuanBus(currentDate, weekday: isOnWeekDay).0 ?? "空"
    }
    
    var XinYuanNext: String {
        bus.getXinYuanBus(currentDate, weekday: isOnWeekDay).1 ?? "空"
    }
    
    var KeYanLouPrevious: String {
        bus.getKeYanLouBus(currentDate, weekday: isOnWeekDay).0 ?? "空"
    }
    
    var KeYanLouNext: String {
        bus.getKeYanLouBus(currentDate, weekday: isOnWeekDay).1 ?? "空"
    }
    
    //---MARK: intents
    
    mutating func swichModel() {
        isOnWeekDay.toggle()
    }
    
    mutating func refreshBus() {
        currentDate = Date()
    }
    
}
