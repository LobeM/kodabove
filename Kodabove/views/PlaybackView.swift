//
//  PlaybackView.swift
//  Kodabove
//
//  Created by Lobe Musonda on 9/26/22.
//

import SwiftUI

struct PlaybackView: View {
    var event: Event
    
    var body: some View {
        VStack {
            Player(url: event.videoUrl).frame(height: UIScreen.main.bounds.height / 2.3)
            
            Text(event.title)
                .font(.title)
                .fontWeight(.heavy)
            
            Text(event.subtitle)
                .font(.title3)
            
            Spacer()
        }
        .navigationTitle("Playback")
    }
}

struct PlaybackView_Previews: PreviewProvider {
    static var previews: some View {
        PlaybackView(event: Event(title: "Liverpool v Porto", subtitle: "UEFA Champions League", date: "2022-09-25T01:30:15.935Z", imageUrl: "https://firebasestorage.googleapis.com/v0/b/dazn-recruitment/o/310176837169_image-header_pDach_1554579780000.jpeg?alt=media&token=1777d26b-d051-4b5f-87a8-7633d3d6dd20", videoUrl: "https://firebasestorage.googleapis.com/v0/b/dazn-recruitment/o/promo.mp4?alt=media"))
    }
}
