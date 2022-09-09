//
//  TaskManager.swift
//  Integrador-iOS
//
//  Created by Jacobo Ezequiel Corvalan on 08/09/2022.
//

import Foundation


protocol ActivityManagerDelegate{
    func didUpdateWeather(tasked: ActivityModel)
    func didFailWithError(error: Error)
}

struct TaskManager {
    
    
    var delegate: ActivityManagerDelegate?
    
    func performRequest(){
        let urlString = "http://www.boredapi.com/api/activity"
        //1. Create a URL
        if let url = URL(string: urlString){
            
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            //3. Give tje session task
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
            
            //let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            
            //4. Start the task
            task.resume()
        }
        
    }
    
    func parseJSON(_ activityData: Data) -> ActivityModel?{
        
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
            
            let detailActivity = ActivityModel(activity: activity, type: type, participants: participant, price: price, link: link, key: key, accessibility: accessibility)
            
            return detailActivity
            
            
        } catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
    

}
