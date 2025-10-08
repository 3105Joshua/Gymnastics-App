//
//  Home.swift
//  Gymnastics Health App
//
//  Created by Joshua Liu on 9/11/24.
//

import SwiftUI

struct Home: View {
    // Task manager properties
    @State private var currentDate: Date = .init()
//    @State private var weekSlider: [] = [WeekDay]
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            // Header view
            HeaderView()
        })
        .vSpacing(.top)
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 5) {
                Text(currentDate.format("MMMM"))
                    .foregroundStyle(.blue)
                
                Text(currentDate.format("YYYY"))
                    .foregroundStyle(.gray)
            }
            .font(.title.bold())
            
            Text(currentDate.formatted(date: .complete, time: .omitted))
                .font(.callout)
                .fontWeight(.semibold)
                .textScale(.secondary)
                .foregroundStyle(.gray)
            
            //Week slider
        }
        .hSpacing(.leading)
        .overlay(alignment: .topTrailing, content: {
            Button(action: {}, label: {
                Image(.pic)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .clipShape(.circle)
            })
        })
        .padding(15)
        .background(.white)
    }
}

#Preview {
    ContentView()
}
