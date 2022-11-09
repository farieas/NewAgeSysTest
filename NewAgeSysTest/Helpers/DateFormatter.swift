//
//  DateFormatter.swift
//  NewAgeSysTest
//
//  Created by WC-64 on 10/11/22.
//  Copyright © 2022 Farhan. All rights reserved.
//

import Foundation

enum DateFormat : String {
    case yyyyMMdd = "yyyy-MM-dd"
    case MMMddyyy = "MMM d, yyyy"
}

struct MyDateFormatter {
    
    
    static func convertDateFromatted(inDate : String,inFormat : DateFormat,outFormat : DateFormat) -> String {
        let inDateObj = dateFromString(inDate: inDate, inFormat: inFormat)
        return dateStringFromDate(inDate: inDateObj, format: outFormat)
    }
    
    
    static func dateFromString(inDate : String,inFormat : DateFormat) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inFormat.rawValue
        return dateFormatter.date(from: inDate) ?? Date()
    }
    
    static func dateStringFromDate(inDate : Date,format : DateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.string(from: inDate)
    }
    
}
