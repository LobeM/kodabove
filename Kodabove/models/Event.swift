//
//  Event.swift
//  Kodabove
//
//  Created by Lobe Musonda on 9/25/22.
//

import SwiftUI

struct Event: Codable, Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var subtitle: String
    var date: String
    var imageUrl: String
    var videoUrl: String
}

struct EventResult: Codable {
    var results: [Event]
}


class apiCall {
    func getEvents(completion: @escaping([Event]) -> ()) {
        guard let url = URL(string: "https://us-central1-dazn-sandbox.cloudfunctions.net/getEvents") else {
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
}
