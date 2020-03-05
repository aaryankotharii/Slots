//
//  ContentView.swift
//  Slots
//
//  Created by Aaryan Kothari on 05/03/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State  private var symbols = ["apple","donut","lemon"]
    @State private var num  = [0,1,1]
    @State private var credits = 1000
    @State private var betAmount = 5
    var body: some View {
        ZStack{
            
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
            .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
            .rotationEffect(Angle(degrees: 45))
            .edgesIgnoringSafeArea(.all)

            VStack{
                Spacer()
                //Title
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("SwiftUI Slots")
                        .bold()
                        .foregroundColor(.white)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.scaleEffect(2)
                Spacer()
                Text("Credits \(credits)")
                    .foregroundColor(.black)
                    .padding(.all,10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                Spacer()
                HStack{
                    
                    CardView(symbol: $symbols[num[0]])
                    CardView(symbol: $symbols[num[1]])
                    CardView(symbol: $symbols[num[2]])
                }
                
                Spacer()
                 
                Button(action: {
                    self.num[0] = Int.random(in: 0...self.symbols.count-1)
                    self.num[1] = Int.random(in: 0...self.symbols.count-1)
                    self.num[2] = Int.random(in: 0...self.symbols.count-1)
                    //
                    if self.num[0] == self.num[1] && self.num[1] == self.num[2] {
                        self.credits += self.betAmount * 10
                    }
                    else{
                        self.credits -= self.betAmount
                    }
                    }){
                        Text("Spin")
                        .bold()
                            .foregroundColor(.white)
                            .padding(.all,10)
                            .padding([.leading,.trailing],30)
                            .background(Color.pink)
                            .cornerRadius(20)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
