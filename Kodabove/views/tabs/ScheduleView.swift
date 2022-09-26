//
//  ScheduleView.swift
//  Kodabove
//
//  Created by Lobe Musonda on 9/25/22.
//

import SwiftUI

struct ScheduleView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.schedules, id: \.id) { schedule in
                ScheduleItem(schedule: schedule)
            }
            .navigationTitle("Schedules")
        }
    }}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
