//
//  Player.swift
//  Kodabove
//
//  Created by Lobe Musonda on 9/26/22.
//

import SwiftUI
import AVKit

struct Player: UIViewControllerRepresentable {
    var url: String
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<Player>) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        let player1 = AVPlayer(url: URL(string: url)!)
        controller.player = player1
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<Player>) {
        
    }
}
