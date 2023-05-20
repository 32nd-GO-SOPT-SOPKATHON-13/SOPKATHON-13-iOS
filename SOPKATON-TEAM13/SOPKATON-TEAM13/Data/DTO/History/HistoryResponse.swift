//
//  HistoryResponse.swift
//  SOPKATON-TEAM13
//
//  Created by Minjoo Kim on 2023/05/21.
//

import Foundation

// MARK: - HistoryResponse
struct HistoryResponse: Codable {
    let code: Int
    let message: String
    let data: [Datum]
    
    func converToHistory() -> [HistoryData] {
        return data.map { HistoryData(month: $0.month, week: $0.week, first: $0.first, last: $0.last) }
    }
}

// MARK: - Datum
struct Datum: Codable {
    let month, week, first, last: String
    let startDate, endDate: String
}
