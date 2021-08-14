//
//  PlatesInfo.swift
//  deginskuhnya
//
//  Created by Dima Kondratiev on 10.08.2021.
//

import SwiftUI

struct PlatesInfo: View {
    var body: some View {
        VStack {
            ZStack {
                
                VStack {
                    Text("название блюда")
                        // вставить название блюд
                        .background(Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)))
                        .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                        .font(.title2)
                        .multilineTextAlignment(.leading)
                        .padding(.trailing, 190)
                    
                    Spacer()
                    
                    Image("cat123321")
                        .frame(width: 350, height: 350, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    // вставить фото с базы
                    
                 
                   
                        Text("описание блюд")
                            
                            //вставить описание блюд
                       
                            .padding(.trailing, 240)
                    Spacer()
                        
                    
                    
                    
                }
            }
            
        }
    }
}

struct PlatesInfo_Previews: PreviewProvider {
    static var previews: some View {
        PlatesInfo()
    }
}

