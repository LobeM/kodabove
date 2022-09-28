//
//  EventItem.swift
//  Kodabove
//
//  Created by Lobe Musonda on 9/25/22.
//

import SwiftUI

struct EventItem: View {
    var event: Event
    
    var body: some View {
        NavigationLink(destination: PlaybackView(event: event)) {
            HStack {
                ListImage(imageUrl: event.imageUrl)
                
                VStack(alignment: .leading) {
                    Text(event.title)
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text(event.subtitle)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .padding(.bottom)
                    
                    Text(event.date)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            .frame(height: 80)
        }
    }
}

struct EventItem_Previews: PreviewProvider {
    static var previews: some View {
        EventItem(event: Event(title: "Liverpool v Porto", subtitle: "UEFA Champions League", date: "2022-09-25T01:30:15.935Z", imageUrl: "https://firebasestorage.googleapis.com/v0/b/dazn-recruitment/o/310176837169_image-header_pDach_1554579780000.jpeg?alt=media&token=1777d26b-d051-4b5f-87a8-7633d3d6dd20", videoUrl: "https://firebasestorage.googleapis.com/v0/b/dazn-recruitment/o/promo.mp4?alt=media", dateTime: Date()))
            .previewLayout(.sizeThatFits)
    }
}
