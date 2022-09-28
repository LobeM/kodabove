//
//  ScheduleItem.swift
//  Kodabove
//
//  Created by Lobe Musonda on 9/26/22.
//

import SwiftUI

struct ScheduleItem: View {
    var schedule: Schedule
    
    var body: some View {
        HStack {
            ListImage(imageUrl: schedule.imageUrl)
            
            VStack(alignment: .leading) {
                Text(schedule.title)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text(schedule.subtitle)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .padding(.bottom)
                
                Text(schedule.date)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .frame(height: 80)
    }
}

struct ScheduleItem_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleItem(schedule: Schedule(title: "Liverpool v Porto", subtitle: "UEFA Champions League", date: "2022-09-26T05:25:57.822Z", imageUrl: "https://firebasestorage.googleapis.com/v0/b/dazn-recruitment/o/310176837169_image-header_pDach_1554579780000.jpeg?alt=media&token=1777d26b-d051-4b5f-87a8-7633d3d6dd20", dateTime: Date()))
    }
}
