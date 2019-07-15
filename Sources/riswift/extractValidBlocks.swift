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




func extractValidBlocks(risdata: String) -> [String]? {
    let range = NSRange(location: 0, length: risdata.utf16.count)
    let results = MyRegexes.blockRegex.matches(in: risdata, range: range)
    let nstr = risdata as NSString
    let strings = results.map { nstr.substring(with: $0.range)}
    if strings.isEmpty {
        return nil
    }
    return strings
}



func extractValidTags(_ block: String) -> [String:String] {
    let matches = MyRegexes.tagRegex.allMatches(block)
    var outdict = [String:String]()
    for match in matches {
        if match.numberOfRanges == 3 {
            let tag = String(block[Range(match.range(at: 1), in: block)!])
            let value = String(block[Range(match.range(at: 2), in: block)!])
            print(tag)
            print(value)
            outdict[tag] = value
            
        } else {
            print("got wrong number of ranges")
            print(match.numberOfRanges)
        }
    }
    return outdict
}
