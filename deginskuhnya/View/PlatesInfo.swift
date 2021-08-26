//
//  PlatesInfo.swift
//  deginskuhnya
//
//  Created by Dima Kondratiev on 10.08.2021.
//

import SwiftUI

struct PlatesInfo: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true,  content: {
            ZStack {
                Image("09")
 
                    .frame(width: viewWidth)
                    .edgesIgnoringSafeArea(.all)
                    
                
                VStack(alignment: .leading) {
                    Text("/name of the plate/")
                        
                        .modifier(TextModifer(textStyle: .bold, color: .black, size: 19))
                        .padding(.bottom, 20)
                    
                    Image("cat123321")
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 25)
                    
                    Text("......n,b,nbkjb,k,.")
		 
                        .modifier(TextModifer(textStyle: .bold, color: .black, size: 25))
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
            
        })
    }
    
}

struct PlatesInfo_Previews: PreviewProvider {
    static var previews: some View {
        PlatesInfo()
    }
}

