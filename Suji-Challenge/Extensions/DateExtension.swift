//
//  DateExtension.swift
//  Suji-Challenge
//
//  Created by Davit Muradyan on 14.02.26.
//
import Foundation

extension Date {
    var birthDateRange: ClosedRange<Date> {
        let calendar = Calendar.current
        let now = Date.now
        
        let maxDate = calendar.date(byAdding: .year, value: -16, to: now) ?? now
        let minDate = calendar.date(byAdding: .year, value: -100, to: now) ?? now
        
        return minDate...maxDate
    }
}
