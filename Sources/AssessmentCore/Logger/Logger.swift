//
//  Logger.swift
//  
//
//  Created by Amit Saini on 26/09/23.
//

import Foundation

public enum LogLevel {
    case info
    case warning
    case error
}

public protocol Logger {
    func log(_ message: String, level: LogLevel)
}

