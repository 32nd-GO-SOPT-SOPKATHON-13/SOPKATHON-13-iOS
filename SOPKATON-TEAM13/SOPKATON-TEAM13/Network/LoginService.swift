//
//  LoginService.swift
//  SOPKATON-TEAM13
//
//  Created by kyun on 2023/05/21.
//

import Foundation

import Alamofire

final class LoginService {
    
    static let get = LoginService()
    
    private init() {}
    
    func signUp(keyNumber: String,
                completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let url = "http://13.125.253.67:8080/user"
        
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        
        let body: Parameters = [
            "keyNumber": keyNumber
        ]
        
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
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
        case 200:
            return isValidData(data: data)
        case 400, 409:
            return isValidData(data: data)
        case 404:
            return .pathErr
        case 500:
            return .serverErr
        default:

            return .networkErr
        }
    }
    
    private func isValidData(data: Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(SignUpResponse.self, from: data) else { print("여긴가?")
            return .pathErr }
        
        return .success(decodedData as Any)
    }
}
