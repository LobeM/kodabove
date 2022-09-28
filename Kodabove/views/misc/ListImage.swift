//
//  ListImage.swift
//  Kodabove
//
//  Created by Lobe Musonda on 9/25/22.
//

import SwiftUI
import CachedAsyncImage

struct ListImage: View {
    var imageUrl: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)){ phase in
            if let image = phase.image {
                image // Displays the loaded image.
                    .resizable()
                    .scaledToFill() 
            } else if phase.error != nil {
                Color.red // Indicates an error.
            } else {
                Image("default") // Acts as a placeholder.
                    .resizable()
                    .scaledToFill()
            }
        }
        .frame(width: 107, height: 80)
        .clipped()
    }
}

struct ListImage_Previews: PreviewProvider {
    static var previews: some View {
        ListImage(imageUrl: "https://firebasestorage.googleapis.com/v0/b/dazn-recruitment/o/310176837169_image-header_pDach_1554579780000.jpeg?alt=media&token=1777d26b-d051-4b5f-87a8-7633d3d6dd20")
            .previewLayout(.sizeThatFits)
    }
}
