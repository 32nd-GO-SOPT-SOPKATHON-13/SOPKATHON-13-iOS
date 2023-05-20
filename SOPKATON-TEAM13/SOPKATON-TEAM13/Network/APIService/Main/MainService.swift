//
//  MainService.swift
//  SOPKATON-TEAM13
//
//  Created by KJ on 2023/05/21.
//

import Foundation

import Alamofire

final class MainCountManager {
    static let shared = MainCountManager()
    
    private init() {}
    
    func getCounts(completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = "http://13.125.253.67:8080" + "/user/1302/complain"
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let dataRequest = AF.request(url, method: .get, headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let data = response.value else { return }
                
                let networkResult = self.judgeStatus(by: statusCode, data)
                print(statusCode)
                completion(networkResult)
            case .failure:
                completion(.networkErr)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
            switch statusCode {
            case 200: return isValidData(data: data)
            case 400, 404: return isValidData(data: data)
            case 500: return .serverErr
            default: return .networkErr
            }
        }
    
    private func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(MainResponses.self, from: data) else {
            return .pathErr}

        return .success(decodedData as Any)
    }
}
