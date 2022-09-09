//
//  Service.swift
//  Integrador-iOS
//
//  Created by Santiago Barragan Leon on 8/09/22.
//

import Foundation

class Service {
    
    func getActivity(url: String, onComplete: @escaping (Activity) -> Void, onError: @escaping () -> Void) {
        ApiManager.shared.get(url: url) { response in
            print(response)
            switch response{
            case .success(let data):
                do{
                    if let data = data {
                        let decoder = JSONDecoder()
                        let activityResponse = try decoder.decode(Activity.self, from: data)
                        onComplete(activityResponse)
                    }
                } catch {
                    onError()
                }
            case .failure(_):
                onError()
            }
        }
    }
    
}
