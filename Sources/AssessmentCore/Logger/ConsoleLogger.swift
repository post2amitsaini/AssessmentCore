//
//  ConsoleLogger.swift
//  
//
//  Created by Amit Saini on 26/09/23.
//

import Foundation

public class ConsoleLogger: Logger {
    public init() { }
    
    public func log(_ message: String, level: LogLevel) {
        let levelText = logLevelText(level)
        print("ConsoleLogger (\(levelText)): \(message)")
    }
    
    private func logLevelText(_ level: LogLevel) -> String {
        switch level {
        case .info: return "INFO"
        case .warning: return "WARNING"
        case .error: return "ERROR"
        }
    }
}
