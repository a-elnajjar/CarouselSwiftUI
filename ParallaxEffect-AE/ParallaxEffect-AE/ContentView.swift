//
//  ContentView.swift
//  ParallaxEffect-AE
//
//  Created by Abdalla El Najjar on 2023-09-14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Main Slider")
            SliderView(items: travelCards)
            Spacer()
            Text("Mini Slider")
            MiniSliderView(items: travelCards)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
