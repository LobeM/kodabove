//
//  Schedule.swift
//  Kodabove
//
//  Created by Lobe Musonda on 9/25/22.
//

import SwiftUI

struct Schedule: Codable, Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var subtitle: String
    var date: String
    var imageUrl: String
}

extension Schedule {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.subtitle = try container.decode(String.self, forKey: .subtitle)
        
        if let apiDate = try container.decodeIfPresent(String.self, forKey: .date) {
            let relativeDateFormatter = DateFormatter()
            relativeDateFormatter.timeStyle = .short
            relativeDateFormatter.dateStyle = .short
            relativeDateFormatter.locale = Locale(identifier: "en_GB")
            relativeDateFormatter.doesRelativeDateFormatting = true
            
            let inputFormatter = DateFormatter()
            inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            let date = inputFormatter.date(from: apiDate)
            
            if let newDate = date {
                self.date = relativeDateFormatter.string(from: newDate)
            } else {
                self.date = ""
            }
            
        } else {
            self.date = ""
        }
        
        self.imageUrl = try container.decode(String.self, forKey: .imageUrl)
    }
}
