//
//  ContentView.swift
//  VideoViewTesting
//
//  Created by Michael Redig on 8/30/20.
//

import SwiftUI
import AVKit

struct ContentView: View {
	@State var player = AVPlayer(url: Bundle.main.url(forResource: "testVideo", withExtension: "mp4")!)
	@State var selection = 0

    var body: some View {
		TabView(selection: $selection) {
			Image(systemName: "square")
				.tag(0)
			VStack {
				VideoPlayer(player: player)
			}
			.tag(1)
			Image(systemName: "circle")
				.tag(2)
		}
		.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
		.indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
		.onChange(of: selection, perform: { value in
			print("changed: \(value)")
			player.pause()
			if selection == 1 {
				player.play()
			}
		})
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
