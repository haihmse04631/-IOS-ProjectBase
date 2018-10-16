//
//  Constants.swift
//  ProjectBase
//
//  Created by Hoàng Hải on 10/16/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

enum DateFormatType: String {
    case time = "HH:mm:ss"
    case dateWithTime = "yyyy/MM/dd　HH:mm"
    case date = "yyyy/MM/dd"
    case hour = "HH:mm"
    case weekday = "EEEE"
    case history = "MM/dd(EEE) hh:mm"
    case dateServer = "yyyy-MM-dd HH:mm:ss"
    case dateJP = "yyyy年MM月dd日"
    case tmpDate = "yyyyMMdd_HHmmss"
    case exifDate = "yyyy:MM:dd HH:mm:ss"
    case heiseiDateJP = "GHM月d日"
}

extension Date {
    
    var day: Int {
        let calendar = Calendar(identifier: .gregorian)
        let component = calendar.dateComponents(Set<Calendar.Component>([.day]), from: self)
        return component.day ?? 0
    }
    
    var month: Int {
        let calendar = Calendar(identifier: .gregorian)
        let component = calendar.dateComponents(Set<Calendar.Component>([.month]), from: self)
        return component.month ?? 0
    }
    
    var year: Int {
        let calendar = Calendar(identifier: .gregorian)
        let component = calendar.dateComponents(Set<Calendar.Component>([.year]), from: self)
        return component.year ?? 0
    }
    
    var weekday: Int {
        let calendar = Calendar(identifier: .gregorian)
        let component = calendar.dateComponents(Set<Calendar.Component>([.weekday]), from: self)
        return component.weekday ?? 0
    }
    
    func toString(format: DateFormatType) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        dateFormatter.locale = Locale(identifier: "ja_JP")
        let newDate = dateFormatter.string(from: self)
        
        return newDate
    }
    
    private func toHeisei(format: DateFormatType) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        dateFormatter.locale = Locale(identifier: "ja_JP@calendar=japanese")
        dateFormatter.dateStyle = .long
        let newDate = dateFormatter.string(from: self)
        return newDate
    }
    
    func toDateString() -> String {
        return toString(format: DateFormatType.date)
    }
    
    func toTimeString() -> String {
        return toString(format: DateFormatType.hour)
    }
    
    func dayOfWeeak() -> String {
        return toString(format: DateFormatType.weekday)
    }
    
    func dateJP() -> String {
        return toString(format: DateFormatType.dateJP)
    }
    
    func heiseiDate() -> String {
        return toHeisei(format: DateFormatType.heiseiDateJP).replacingOccurrences(of: "平成", with: "H")
    }
}
