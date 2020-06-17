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
    let currentDate = Date()
    let bus = Bus()

    init() {
        dayFormatter.dateFormat = "HH:mm"
    }

    var isOnWeekDay: Bool {
        !calender.isDateInWeekend(currentDate)
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
}
