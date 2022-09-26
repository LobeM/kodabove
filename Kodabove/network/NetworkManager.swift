//
//  NetworkManager.swift
//  Kodabove
//
//  Created by Lobe Musonda on 9/26/22.
//

import SwiftUI
import Combine

class NetworkManager: ObservableObject {
    @Published var events: [Event] = []
    @Published var schedules: [Schedule] = []
    @Published var loading: Bool = false
    
    private var timer: Timer?
    private let baseUrl = "https://us-central1-dazn-sandbox.cloudfunctions.net"
    
    init() {
        loading = true;
        getEvents()
        getSchedules()
        timer = Timer.scheduledTimer(withTimeInterval: 30, repeats: true, block: { _ in
            self.getSchedules()
        })
    }
    
    deinit {
        timer?.invalidate()
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
                self.events = events
                self.loading = false
            }
        }
        .resume()
    }
    
    private func getSchedules() {
        guard let url = URL(string: "\(baseUrl)/getSchedule") else {
            print("API not found")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            let schedules = try! JSONDecoder().decode([Schedule].self, from: data)
            
            DispatchQueue.main.async {
                self.schedules = schedules
            }
        }
        .resume()
    }
}
