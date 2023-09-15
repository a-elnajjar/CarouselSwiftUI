//
//  SliderView.swift
//  ParallaxEffect-AE
//
//  Created by Abdalla El Najjar on 2023-09-14.
//

import SwiftUI

struct SliderView<T: CardItem>: View {
    var items: [T]
    init(items: [T]) {
        self.items = items
    }
    
    var body: some View {
        GeometryReader(content: { geometry in
            let size = geometry.size
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 6) {
                    ForEach(items) { item in
                        GeometryReader(content: { proxy in
                            let cardSize = proxy.size
                            let minX = min((proxy.frame(in: .global).minX - 30.0) * 1.4, size.width * 1.2)
                            Image(item.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .scaleEffect(1.3)
                                .offset(x: -minX)
                                .frame(width: cardSize.width )
                                .frame(height: cardSize.height)
                                .overlay {
                                    OverlayView(item)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                                .shadow(color: Color.black.opacity(0.25), radius: 8, x: 5, y: 10)
                        })
                        .frame(width: size.width - 60, height: size.height - 50)
                        .frame(maxHeight: .infinity) // Expand the height to fill ScrollView
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 5)
            .frame(height: size.height, alignment: .top)
        })
        .frame(height: 500)
    }

    @ViewBuilder
    func OverlayView(_  item: T) -> some View {
        ZStack(alignment: .bottomLeading, content: {
            LinearGradient(colors: [
                .clear,
                .clear,
                .clear,
                Color(red: 0.10, green: 0.10, blue: 0.10).opacity(0.1),
                Color(red: 0.10, green: 0.10, blue: 0.10).opacity(0.7),
            ], startPoint: .top, endPoint: .bottom)

            VStack(alignment: .leading, spacing: 4, content: {
                Text(item.title)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .padding(.bottom, 4)

                Text(item.subTitle)
                    .font(.callout)
                    .foregroundColor(.white)
            })
            .padding(20)
        })
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(items: travelCards)
    }
}
