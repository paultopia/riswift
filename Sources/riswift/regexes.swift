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
    func allMatches(_ str: String) -> [NSTextCheckingResult] {
        let range = NSRange(location: 0, length: str.utf16.count)
        return self.matches(in: str, options: [], range: range)
    }
}


extension String {
    func matches(_ pattern: String) -> Bool {
        guard let _ = self.range(of: pattern, options: .regularExpression) else {
            return false
        }
        return true
    }
    func matches(_ pattern: Regex) -> Bool {
        let range = NSRange(location: 0, length: self.utf16.count)
        return pattern.firstMatch(in: self, options: [], range: range) != nil
    }
    func completelyMatches(_ pattern: String) -> Bool {
        guard let range = self.range(of: pattern, options: .regularExpression) else {
            return false
        }
        return self[range] == self
    }
    func completelyMatches(_ pattern: Regex) -> Bool {
        let range = NSRange(location: 0, length: self.utf16.count)
        guard let match = pattern.firstMatch(in: self, options: [], range: range) else {
            return false
        }
        return self[Range(match.range, in: self)!] == self
    }
}


extension NSRange {
    func matchedText(_ str: String) -> String {
        return String(str[Range(self, in: str)!])
    }
}

extension String {
    func matchRange(_ range: NSRange) -> String {
        return String(self[Range(range, in: self)!])
    }
}


struct MyRegexes {
    static let blockRegex = Regex(#"[\r\n]{2}TY  - .*?ER  -"#, options: [.dotMatchesLineSeparators])
    static let rpOnFile = Regex(#"ON REQUEST \d\d/\d\d/\d\d"#)
    static let tagRegex = Regex(#"^([A-Z1-3]{2})\s\s-\s(.*?)$"#, options: [.anchorsMatchLines])
}
