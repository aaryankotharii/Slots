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
                VStack {
                   Button(action: {
                    self.processResult()
                        }){
                            Text("Spin")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.all,10)
                                .padding([.leading,.trailing],30)
                                .background(Color.pink)
                                .cornerRadius(20)
                    }
                    Text("5 credits")
                            .foregroundColor(.white)
                            .padding(.top,10)
                            .font(.footnote)
                }
                Spacer()
            }
        }
    }
    
    func processResult(_ isMax : Bool = false){
        
        if isMax {
        self.num = self.num.map({ _ in
            Int.random(in: 0...self.symbols.count-1)
        })
        }
        else{
            num[3] = Int.random(in: 0...self.symbols.count-1)
            num[4] = Int.random(in: 0...self.symbols.count-1)
            num[5] = Int.random(in: 0...self.symbols.count-1)
        }
        self.processWin(isMax)
    }
    
    func processWin(_ isMax : Bool = false){
        var matches = 0
        
        if !isMax{
            //single spin
            if self.num[3] == self.num[4] && self.num[4] == self.num[4] {
                //self.credits += self.betAmount * 10
                matches += 1
                self.background[3] = Color.green
                self.background[4] = Color.green
                self.background[5] = Color.green
            }
            else{
                //self.background = .white
                self.credits -= self.betAmount
            }
        }
        else{
          // processign for maxSpin
            if self.num[0] == self.num[1] && self.num[1] == self.num[2] {
                //self.credits += self.betAmount * 10
                matches += 1
                self.background[0] = Color.green
                self.background[1] = Color.green
                self.background[2] = Color.green
            
        }
        
            if self.num[3] == self.num[4] && self.num[4] == self.num[4] {
                //self.credits += self.betAmount * 10
                matches += 1
                self.background[3] = Color.green
                self.background[4] = Color.green
                self.background[5] = Color.green

    }
            
            if self.num[6] == self.num[7] && self.num[7] == self.num[7] {
                //self.credits += self.betAmount * 10
                matches += 1
                self.background[7] = Color.green
                self.background[8] = Color.green
                self.background[9] = Color.green
}
            if self.num[0] == self.num[4] && self.num[4] == self.num[8] {
                //self.credits += self.betAmount * 10
                matches += 1
                self.background[0] = Color.green
                self.background[4] = Color.green
                self.background[8] = Color.green
            }
            
            if self.num[2] == self.num[4] && self.num[6] == self.num[4] {
                //self.credits += self.betAmount * 10
                matches += 1
                self.background[2] = Color.green
                self.background[4] = Color.green
                self.background[6] = Color.green
                
            }
            
            if matches > 0{
                // atleast 1 win
                self.credits += matches * betAmount * 2
            }
            else if !isMax {
                //0 wins single spin
                self.credits -= betAmount
            }
            else{
                //0 wins max spin
                self.credits -= betAmount * 5
            }
            
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

