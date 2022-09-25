//
//  MainView.swift
//  Kodabove
//
//  Created by Lobe Musonda on 9/25/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            EventsView()
                .tabItem {Label("Events", systemImage: "play.tv")}
            
            ScheduleView()
                .tabItem {Label("Schedule", systemImage: "list.bullet")}
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
