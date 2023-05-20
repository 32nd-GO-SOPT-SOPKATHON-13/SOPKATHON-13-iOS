//
//  HistoryService.swift
//  SOPKATON-TEAM13
//
//  Created by KJ on 2023/05/21.
//

import Foundation

import Alamofire

final class HistoryService {
    
    static let shared = HistoryService()
    
    func getHistory(completion: @escaping (NetworkResult <Any>) -> Void) {
        
        let url = "http://13.125.253.67:8080/user/1302/weeklyList"
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        
        print("\(url)")
        let dataRequest = AF.request(url,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                print("\(statusCode)")
                guard let value = response.value else { return }
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
                
            case .failure:
                completion(.networkErr)
            }
        }
            
    }
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        
        switch statusCode {
        case 200: return isValidData(data: data)
        case 400, 409: return isValidData(data: data)
        case 500: return .serverErr
        default: return .networkErr
        }
    }
    private func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(HistoryResponse.self, from: data) else { return .pathErr }
        return .success(decodedData as Any)
    }
}
