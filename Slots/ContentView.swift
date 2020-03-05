//
//  ContentView.swift
//  Slots
//
//  Created by Aaryan Kothari on 05/03/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
            .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
            .rotationEffect(Angle(degrees: 45))
            .edgesIgnoringSafeArea(.all)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
