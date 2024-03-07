//
//  HeaderSection.swift
//  Little Lemon
//
//  Created by Tam Hac on 04/03/2024.
//

import SwiftUI

struct HeaderSection: View {
    @Binding var searchQuery: String
    var body: some View {
        Group {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Little Lemon").font(.largeTitle).foregroundStyle(.yellow)
                        Text("Chicago").font(.title2).foregroundStyle(.white)
                        Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.").lineLimit(nil).foregroundStyle(.white).frame(height: 120)
                    }
                    Spacer()
                    Image(.highlightedFood).resizable().aspectRatio(contentMode: .fill).frame(width: 150, height: 150).clipShape(RoundedRectangle(cornerRadius: 8))
                }
                SearchTextField(searchQuery: $searchQuery)
            }.padding(.vertical)
                .background(Color.mineralGreen).padding(.horizontal)
        }.background(Color.mineralGreen)
    }
}

#Preview {
    HeaderSection(searchQuery: .constant(""))
}
