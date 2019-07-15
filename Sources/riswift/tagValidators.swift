//
//  tagValidators.swift
//  riswift
//
//  Created by Paul Gowder on 7/14/19.
//

import Foundation


let acceptableTags = Set(["TY",
                          "ER",
                          "ID",
                          "TI",
                          "T2",
                          "T3",
                          "AU",
                          "A1",
                          "A2",
                          "A3",
                          "ED",
                          "PY",
                          "Y1",
                          "Y2",
                          "N1",
                          "N2",
                          "AB",
                          "KW",
                          "RP",
                          "AV",
                          "SP",
                          "EP",
                          "JO",
                          "JF",
                          "J1",
                          "J2",
                          "VL",
                          "IS",
                          "CY",
                          "PB",
                          "SN",
                          "AD",
                          "UR",
                          "U1",
                          "U2",
                          "U3",
                          "U4",
                          "U5",
                          "M1",
                          "M2",
                          "M3"])



let canBeMultiple = Set(["AU",
                         "A1",
                         "A2",
                         "A3",
                         "ED"])


let permissibleTypes = Set(["ABST",
                            "ADVS",
                            "ART",
                            "BILL",
                            "BOOK",
                            "CASE",
                            "CHAP",
                            "COMP",
                            "CONF",
                            "CTLG",
                            "DATA",
                            "ELEC",
                            "GEN",
                            "HEAR",
                            "ICOMM",
                            "INPR",
                            "JFULL",
                            "JOUR",
                            "MAP",
                            "MGZN",
                            "MPCT",
                            "MUSIC",
                            "NEWS",
                            "PAMP",
                            "PAT",
                            "PCOMM",
                            "RPRT",
                            "SER",
                            "SLIDE",
                            "SOUND",
                            "STAT",
                            "THES",
                            "UNBILL",
                            "UNPB",
                            "VIDEO"])


func RPValidator(_ rp: String) -> Bool {
    switch rp {
    case "IN FILE":
        return true
    case "NOT IN FILE":
        return true
    default:
        return false
    }
}

var tagValidators: [String: (String) -> Bool] = ["TY":{permissibleTypes.contains($0)}]

