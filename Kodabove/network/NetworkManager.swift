//
//  NetworkManager.swift
//  Kodabove
//
//  Created by Lobe Musonda on 9/26/22.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var events: [Event] = []
    @Published var schedules: [Schedule] = []
    @Published var loading: Bool = false
    
    private let baseUrl = "https://us-central1-dazn-sandbox.cloudfunctions.net"
    
    init() {
        loading = true;
        getEvents()
        getSchedules()
    }
    
    private func getEvents() {
        guard let url = URL(string: "\(baseUrl)/getEvents") else {
            print("API not found")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            let events = try! JSONDecoder().decode([Event].self, from: data)
            
            DispatchQueue.main.async {
//                completion(events)
                self.events = events
                self.loading = false
            }
        }
        .resume()
    }
    
    func getSchedules() {
        guard let url = URL(string: "\(baseUrl)/getSchedule") else {
            print("API not found")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            let schedules = try! JSONDecoder().decode([Schedule].self, from: data)
            
            DispatchQueue.main.async {
//                completion(schedule)
                self.schedules = schedules
                self.loading = false
            }
        }
        .resume()
    }
}
