//
//  MiniSliderView.swift
//  ParallaxEffect-AE
//
//  Created by Abdalla El Najjar on 2023-09-15.
//

import SwiftUI

struct MiniSliderView<T: CardItem>: View {
    var items: [T]
    init(items: [T]) {
        self.items = items
    }
    
    var body: some View {
            GeometryReader(content: { geometry in
                let size = geometry.size
                
                ScrollView(.horizontal) {
                    HStack(spacing: 5) {
                        ForEach(items) { item in
                            GeometryReader(content: { proxy in
                                let cardSize = proxy.size
                                let minX = min((proxy.frame(in: .global).minX - 30.0) * 1.4, size.width * 1.2)
                                
                                Image(item.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .scaleEffect(1.3)
                                    .offset(x: -minX)
                                    .frame(width: proxy.size.width * 2.5)
                                    .frame(width: cardSize.width, height: cardSize.height)
                                    .overlay {
                                        OverlayView(item)
                                    }
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                    .shadow(color: Color.black.opacity(0.25), radius: 8, x: 5, y: 10)
                            })
                            .frame(width: size.width - 60, height: size.height - 50)

                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .frame(height: size.height, alignment: .top)
                }
                
            })
            .frame(height: 200)
        }
        
        @ViewBuilder
        func OverlayView(_  item: T) -> some View {
            ZStack(alignment: .center, content: {
                Color(red: 0.10, green: 0.10, blue: 0.10)
                    .opacity(0.6)
                VStack(spacing: 4, content: {
                    Text(item.title)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundStyle(.white)
                    Text(item.subTitle)
                        .font(.callout)
                        .foregroundStyle(.white)
                })
                .padding(20)
            })
        }
    }

struct MiniSliderView_Previews: PreviewProvider {
    static var previews: some View {
        MiniSliderView(items: travelCards)
    }
}
