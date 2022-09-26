//
//  EventsView.swift
//  Kodabove
//
//  Created by Lobe Musonda on 9/25/22.
//

import SwiftUI

struct EventsView: View {
    @State var events = [Event]()
    
    var body: some View {
        NavigationView {
            List(events) { event in
                EventItem(event: event)
            }
            .onAppear {
                NetworkManager().getEvents { (events) in
                    self.events = events
                }
            }
            .navigationTitle("Events")
        }
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
