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
