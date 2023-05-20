//
//  SignUpResponse.swift
//  SOPKATON-TEAM13
//
//  Created by KJ on 2023/05/20.
//

import Foundation

// MARK: - SignUpResponse
struct SignUpResponse: Codable {
    let code: Int
    let message: String
    let data: Int
}
