//
//  NetworkManager.swift
//  TestApp
//
//  Created by Елена Воронцова on 15.12.2023.
//

import UIKit
import Alamofire

final class NetworkManager {
    
    static let shared = NetworkManager()
    let apiKey = "d08d450a70e6a6e3c5516d1822c69a8a4dae9fbc"
    init() {}
    
    func fetchAPIData(query: String, complition: @escaping(Result<[AddressData.Response], Alert>) -> Void) {
        let request = AddressData()
        let url = request.path
        let params: Parameters = ["query": query, "locations_boost": ["kladr_id": "1800000100000"]]
        let httpHeaders: HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Token \(self.apiKey)"
        ]
        
        guard InternetAvailability().isInternetAvailable else {
            DispatchQueue.main.async {
                complition(.failure(.noInternet))
            }
            return
        }
        
        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: httpHeaders).validate(statusCode: 200 ..< 299).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                        DispatchQueue.main.async {
                            complition(.failure(.dataError))
                        }
                        return
                    }
                    guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                        DispatchQueue.main.async {
                            complition(.failure(.dataError))
                        }
                        return
                    }
                    guard String(data: prettyJsonData, encoding: .utf8) != nil else {
                        DispatchQueue.main.async {
                            complition(.failure(.dataError))
                        }
                        return
                    }
                    let results = try JSONDecoder().decode(AddressData.AddressDataResponse.self, from: data)
                    complition(.success([results]))
                } catch {
                    DispatchQueue.main.async {
                        complition(.failure(.dataError))
                    }
                    return
                }
            case .failure(_):
                complition(.failure(.error))
            }
        }
    }
}
