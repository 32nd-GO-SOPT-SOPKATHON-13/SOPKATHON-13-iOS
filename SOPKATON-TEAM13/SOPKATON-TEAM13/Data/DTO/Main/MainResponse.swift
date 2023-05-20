//
//  MainResponse.swift
//  SOPKATON-TEAM13
//
//  Created by KJ on 2023/05/20.
//

import Foundation

struct MainResponses: Codable {
    let code: Int
    let message: String
    let data: PokingData
}

// MARK: - DataClass
struct PokingData: Codable {
    var up, dataRight, dataLeft, down: [Int]
    var receiveCount: Int

    enum CodingKeys: String, CodingKey {
        case up
        case dataRight = "right"
        case dataLeft = "left"
        case down, receiveCount
    }
}
