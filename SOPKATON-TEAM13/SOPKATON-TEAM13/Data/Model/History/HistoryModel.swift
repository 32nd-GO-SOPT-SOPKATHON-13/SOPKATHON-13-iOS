//
//  HistoryModel.swift
//  SOPKATON-TEAM13
//
//  Created by KJ on 2023/05/20.
//

import UIKit

struct HistoryData {
    let month: String
    let week: String
    let first: String
    let last: String
}

extension HistoryData {
    
    static func dummy() -> [HistoryData] {
        return [HistoryData(month: "5",
                            week: "3",
                            first: "5.15",
                            last: "5.21"),
                HistoryData(month: "5",
                            week: "2",
                            first: "5.8",
                            last: "5.14"),
                HistoryData(month: "5",
                            week: "1",
                            first: "5.1",
                            last: "5.7"),
                HistoryData(month: "4",
                            week: "5",
                            first: "4.24",
                            last: "4.30"),
                HistoryData(month: "4",
                            week: "4",
                            first: "4.17",
                            last: "4.23"),
                HistoryData(month: "4",
                            week: "3",
                            first: "4.10",
                            last: "4.16"),
                HistoryData(month: "4",
                            week: "2",
                            first: "4.3",
                            last: "4.9")]
    }
}
