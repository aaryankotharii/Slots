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
                      
                      CardView(symbol: $symbols[num[0]], background: $background[0])
                      CardView(symbol: $symbols[num[1]], background: $background[1])
                      CardView(symbol: $symbols[num[2]], background: $background[2])
                  }
                HStack{
                        
                        CardView(symbol: $symbols[num[3]], background: $background[3])
                    CardView(symbol: $symbols[num[4]], background: $background[4])
                        CardView(symbol: $symbols[num[5]], background: $background[5])
                    }
                    HStack{
                          
                          CardView(symbol: $symbols[num[6]], background: $background[6])
                          CardView(symbol: $symbols[num[7]], background: $background[7])
                          CardView(symbol: $symbols[num[8]], background: $background[8])
                      }
                }
                
                Spacer()
                HStack(spacing: 20) {
                    
                    
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
                        Text("\(betAmount) credits")
                                .padding(.top,10)
                                .font(.footnote)
                    }
                VStack {
                       Button(action: {
                        self.processResult(true)
                            }){
                                Text("Max Spin")
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding(.all,10)
                                    .padding([.leading,.trailing],30)
                                    .background(Color.pink)
                                    .cornerRadius(20)
                        }
                        Text("\(betAmount*5) credits")
                                .padding(.top,10)
                                .font(.footnote)
                    }
                }
                Spacer()
            }
        }
    }
    
    func processResult(_ isMax : Bool = false){
        
        self.background = self.background.map({ _ in
            Color.white
        })
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
        processWin(isMax)
    }
    
    func processWin(_ isMax : Bool = false){
        var matches = 0
        
        if !isMax{
            //single spin
            if isMatch(3,4,5){ matches+=1 }
        }
        else{
          // processign for maxSpin

            if isMatch(0,1,2){ matches+=1 }
            if isMatch(3,4,5){ matches+=1 }
            if isMatch(6,7,8){ matches+=1 }
            if isMatch(0,4,8){ matches+=1 }
            if isMatch(2,4,6){ matches+=1 }
            
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
    
    func isMatch(_ index1 : Int, _ index2 : Int, _ index3 : Int) -> Bool{
            if self.num[index1] == self.num[index2] && self.num[index2] == self.num[index3] {
                print(index1,index2,index3)
                self.background[index1] = Color.green
                self.background[index2] = Color.green
                self.background[index3] = Color.green
                return true
        }
        return false
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

