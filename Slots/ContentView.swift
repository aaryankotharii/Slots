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
    @State private var num  = Array(repeating: 0, count: 9)
    @State private var credits = 1000
    @State private var background = Array(repeating: Color.white, count: 9)
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
                VStack{
                HStack{
                      
                      CardView(symbol: $symbols[num[0]], background: $background[num[0]])
                      CardView(symbol: $symbols[num[1]], background: $background[num[1]])
                      CardView(symbol: $symbols[num[2]], background: $background[num[2]])
                  }
                HStack{
                        
                        CardView(symbol: $symbols[num[3]], background: $background[num[3]])
                    CardView(symbol: $symbols[num[4]], background: $background[num[4]])
                        CardView(symbol: $symbols[num[5]], background: $background[num[5]])
                    }
                    HStack{
                          
                          CardView(symbol: $symbols[num[6]], background: $background[num[6]])
                          CardView(symbol: $symbols[num[7]], background: $background[num[7]])
                          CardView(symbol: $symbols[num[8]], background: $background[num[8]])
                      }
                }
                
                Spacer()
                 
                Button(action: {
                    self.num = self.num.map({ _ in
                        Int.random(in: 0...self.symbols.count-1)
                    })
                    //
                    if self.num[0] == self.num[1] && self.num[1] == self.num[2] {
                        self.credits += self.betAmount * 10
                       // self.background = .green
                    }
                    else{
                        //self.background = .white
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
