//
//  NetworkManager.swift
//  Kodabove
//
//  Created by Lobe Musonda on 9/26/22.
//

import Foundation

class NetworkManager {
    private let baseUrl = "https://us-central1-dazn-sandbox.cloudfunctions.net"
    
    func getEvents(completion: @escaping([Event]) -> ()) {
        guard let url = URL(string: "\(baseUrl)/getEvents") else {
            print("API not found")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let events = try! JSONDecoder().decode([Event].self, from: data!)
            
            DispatchQueue.main.async {
                completion(events)
            }
        }
        .resume()
    }
    
    func getSchedules(completion: @escaping([Schedule]) -> ()) {
        guard let url = URL(string: "\(baseUrl)/getSchedule") else {
            print("API not found")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let schedule = try! JSONDecoder().decode([Schedule].self, from: data!)
            
            DispatchQueue.main.async {
                completion(schedule)
            }
        }
        .resume()
    }
}
