//
//  regexes.swift
//  riswift
//
//  Created by Paul Gowder on 7/14/19.
//

import Foundation

final class Regex: NSRegularExpression, ExpressibleByStringLiteral {
    convenience init(_ pattern: String) {
        do {
            try self.init(pattern: pattern)
        } catch {
            preconditionFailure("Illegal regular expression: \(pattern).")
        }
    }
    convenience init(_ pattern: String, options: Regex.Options) {
        do {
            try self.init(pattern: pattern, options: options)
        } catch {
            preconditionFailure("Illegal regular expression: \(pattern).")
        }
    }
    convenience init(stringLiteral value: String) {
        self.init(value)
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

struct MyRegexes {
    static let blockRegex = Regex(#"[\r\n]{2}TY  - .*?ER  -"#, options: [.dotMatchesLineSeparators])
}
