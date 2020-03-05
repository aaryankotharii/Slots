//
//  CardView.swift
//  Slots
//
//  Created by Aaryan Kothari on 05/03/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import SwiftUI

struct CardView: View {
    @Binding var symbol : String
    var body: some View {
        Image(symbol)
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .background(Color.white.opacity(0.5))
            .cornerRadius(20)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(symbol: Binding.constant("apple"))
    }
}
