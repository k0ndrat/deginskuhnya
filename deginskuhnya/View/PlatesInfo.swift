//
//  PlatesInfo.swift
//  deginskuhnya
//
//  Created by Dima Kondratiev on 10.08.2021.
//

import SwiftUI

struct PlatesInfo: View {
    var body: some View {
        ZStack {
            
            VStack(alignment: .leading) {
                Text("название блюда")
                    .modifier(TextModifer(textStyle: .bold, color: .black, size: 40))
                    .padding(.bottom, 20)
                
                Image("cat123321")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 25)
                
                    Text("asdfasdfasdf")
                
                Spacer()
            }
            .padding(.horizontal)
        }
        
    }
}

struct PlatesInfo_Previews: PreviewProvider {
    static var previews: some View {
        PlatesInfo()
    }
}

