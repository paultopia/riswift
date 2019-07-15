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
    func matches(_ pattern: NSRegularExpression) -> Bool {
        // also swiped from HWS but flipped around to be extension on string
        let range = NSRange(location: 0, length: self.utf16.count)
        return pattern.firstMatch(in: self, options: [], range: range) != nil
    }
    
    func completelyMatches(_ pattern: NSRegularExpression) -> Bool {
        return true
    }
}

let blockPattern = #"[\r\n]{2}TY  - .*?ER  -"#
let blockOptions: NSRegularExpression.Options = [.dotMatchesLineSeparators]
let blockRegex = try! NSRegularExpression(pattern: blockPattern, options: blockOptions)

