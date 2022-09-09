//
//  TaskManager.swift
//  Integrador-iOS
//
//  Created by Jacobo Ezequiel Corvalan on 08/09/2022.
//

import Foundation

protocol ActivityManagerDelegate{
    func didUpdateWeather(tasked: ActivityData)
    func didFailWithError(error: Error)
}

struct TaskManager {
    
    var delegate: ActivityManagerDelegate?
    
    func performRequest(){
        let urlString = "http://www.boredapi.com/api/activity"
        if let url = URL(string: urlString){
            getData(for: url)
        }
        
    }
    
    func performRequestForCategory(_ category: String){
        let urlString = "http://www.boredapi.com/api/activity?type=\(category)"
        if let url = URL(string: urlString){
            getData(for: url)
        }
        
    }
    
    func performRequestForParticipants(_ participants: String) {
        let urlString = "http://www.boredapi.com/api/activity?participants=\(participants)"
        if let url = URL(string: urlString) {
            getData(for: url)
        }
    }
    
    private func getData(for url: URL) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil{
                self.delegate?.didFailWithError(error: error!)
                return
            }
            if let safeData = data {
                if let activityData = self.parseJSON(safeData){
                    
                    self.delegate?.didUpdateWeather(tasked: activityData)
                    
                }
            }
        }
        task.resume()
    }
    
    private func parseJSON(_ activityData: Data) -> ActivityData?{
        
        let decoder = JSONDecoder()
        do {
           let decodedData = try decoder.decode(ActivityData.self, from: activityData)
            
            let activity = decodedData.activity
            let participant = decodedData.participants
            let price = decodedData.price
            let type = decodedData.type
            let link = decodedData.link
            let key = decodedData.key
            let accessibility = decodedData.accessibility
            
            let detailActivity = ActivityData(activity: activity, type: type, participants: participant, price: price, link: link, key: key, accessibility: accessibility)
            
            return detailActivity
            
            
        } catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
    

}
