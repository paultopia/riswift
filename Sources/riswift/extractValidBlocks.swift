//
//  extractValidBlocks.swift
//  riswift
//
//  Created by Paul Gowder on 7/14/19.
//
// SOURCE FOR FORMAT INFO: http://refdb.sourceforge.net/manual-0.9.6/sect1-ris-format.html

//let pattern = "\n\nTY  - .*?ER  -"
//let pattern = "ER"

import Foundation

let blockPattern = #"[\r\n]{2}TY  - .*?ER  -"#
let blockOptions: NSRegularExpression.Options = [.dotMatchesLineSeparators]
let blockRegex = try! NSRegularExpression(pattern: blockPattern, options: blockOptions)



func extractValidBlocks(risdata: String) -> [String]? {
    let range = NSRange(location: 0, length: risdata.utf16.count)
    let results = blockRegex.matches(in: risdata, range: range)
    let nstr = risdata as NSString
    let strings = results.map { nstr.substring(with: $0.range)}
    if strings.isEmpty {
        return nil
    }
    return strings
}
