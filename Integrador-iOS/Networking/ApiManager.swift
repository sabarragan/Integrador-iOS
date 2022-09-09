//
//  ApiManager.swift
//  Integrador-iOS
//
//  Created by Santiago Barragan Leon on 8/09/22.
//

import Foundation
import Alamofire

class ApiManager {
    
    static let shared = ApiManager()
    
    func get(url: String, completion: @escaping (Result<Data?, AFError>) -> Void) {
        AF.request(url).response {
            response in completion(response.result)
        }
    }
}
