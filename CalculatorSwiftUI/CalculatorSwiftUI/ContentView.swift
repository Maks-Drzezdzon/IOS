//
//  ContentView.swift
//  CalculatorSwiftUI
//
//  Created by Maks Drzezdzon on 04/01/2020.
//  Copyright © 2020 Maks Drzezdzon. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let buttons = [
        ["1", "2", "3" , "4"],
        ["1", "2", "3" , "4"],
        ["1", "2", "3" , "4"],
        ["1", "2", "3" , "4"]
    ]
    
    var body: some View {
        ZStack{
            Color.black
            VStack{
                ForEach(buttons, id : \.self){ row in
                    HStack{
                        ForEach(row, id: \.self){ button in
                            Text(button)
                                .font(.system(size: 32))
                                .frame(width: 80, height: 80)
                                .foregroundColor(.white)
                        }
                    }
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
