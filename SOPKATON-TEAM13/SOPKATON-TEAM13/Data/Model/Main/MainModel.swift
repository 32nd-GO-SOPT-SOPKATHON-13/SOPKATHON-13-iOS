//
//  MainModel.swift
//  SOPKATON-TEAM13
//
//  Created by KJ on 2023/05/20.
//

import Foundation

struct NeighborModel: Codable {
    var upperCount, lowerCount, leftCount, rightCount: [Int]
    var myCount: Int
}
