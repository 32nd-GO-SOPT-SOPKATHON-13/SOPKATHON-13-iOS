//
//  NoticeResponse.swift
//  SOPKATON-TEAM13
//
//  Created by KJ on 2023/05/20.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let contentResponse = try? JSONDecoder().decode(ContentResponse.self, from: jsonData)

import Foundation

// MARK: - ContentResponse
struct NoticeResponse: Codable {
    let code: Int
    let message: String
    let data: DataClass
    
    func convertToNotice() -> [NoticeServerModel] {
        return [
            NoticeServerModel(count: data.averageCount),
            NoticeServerModel(count: data.complainedDays),
            NoticeServerModel(count: data.complainedCount)
        ]
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    let averageCount, complainedDays, complainedCount: Int
}
