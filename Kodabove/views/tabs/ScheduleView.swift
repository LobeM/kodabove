//
//  ScheduleView.swift
//  Kodabove
//
//  Created by Lobe Musonda on 9/25/22.
//

import SwiftUI

struct ScheduleView: View {
    @State var schedules = [Schedule]()
    
    var body: some View {
        NavigationView {
            List(schedules) { schedule in
                ScheduleItem(schedule: schedule)
            }
            .onAppear {
                NetworkManager().getSchedules { (events) in
                    self.schedules = events
                }
            }
            .navigationTitle("Schedules")
        }
    }}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
