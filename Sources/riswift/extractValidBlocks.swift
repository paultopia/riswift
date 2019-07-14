//
//  extractValidBlocks.swift
//  riswift
//
//  Created by Paul Gowder on 7/14/19.
//

//let pattern = "\n\nTY  - .*?ER  -"
//let pattern = "ER"
let pattern = "[\r\n]{2}TY  - .*?ER  -"
let regexOptions: NSRegularExpression.Options = [.dotMatchesLineSeparators]
let regex = try! NSRegularExpression(pattern: pattern, options: regexOptions)

import Foundation

func extractValidBlocks(risdata: String) -> [String] {
    let range = NSRange(location: 0, length: risdata.utf16.count)
    let results = regex.matches(in: risdata, range: range)
    let nstr = risdata as NSString
    let strings = results.map { nstr.substring(with: $0.range)}
    return strings
}
