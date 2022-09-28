//
//  EventsView.swift
//  Kodabove
//
//  Created by Lobe Musonda on 9/25/22.
//

import SwiftUI

struct EventsView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            ZStack {
                if networkManager.isLoading {
                    ProgressView()
                } else {
                    ScrollView {
                        LazyVStack(alignment: .leading) {
                            ForEach(networkManager.events, id: \.id) { event in
                                EventItem(event: event)
                            }
                        }
                        .accessibilityIdentifier("eventsList")
                    }
                    .refreshable {
                        networkManager.fetchEvents()
                    }
                    .overlay {
                        if networkManager.isFetching {
                            ProgressView()
                        }
                    }
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
