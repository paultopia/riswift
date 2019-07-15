//
//  regexes.swift
//  riswift
//
//  Created by Paul Gowder on 7/14/19.
//

import Foundation

extension NSRegularExpression {
    // swiped from https://www.hackingwithswift.com/articles/108/how-to-use-regular-expressions-in-swift
    convenience init(_ pattern: String) {
        do {
            try self.init(pattern: pattern)
        } catch {
            preconditionFailure("Illegal regular expression: \(pattern).")
        }
    }
}

extension String {
    func matches(_ pattern: String) -> Bool {
        guard let _ = self.range(of: pattern, options: .regularExpression) else {
            return false
        }
        return true
    }
    
    func completelyMatches(_ pattern: String) -> Bool {
        guard let range = self.range(of: pattern, options: .regularExpression) else {
            return false
        }
        return self[range] == self
    }
}

