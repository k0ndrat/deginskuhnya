//
//  MainPage.swift
//  deginskuhnya
//
//  Created by Vladislav Condratiev on 14.08.2021.
//

import SwiftUI

struct MainPage: View {
    
    @ObservedObject private var vm = MainPageVM()
    
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .scaledToFill()
                .scaleEffect(1.1)
                .blur(radius: 2)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("SELECT YOUR DISHES")
                    .modifier(TextModifer(textStyle: .bold, size: 20))
                    .padding()
                    .background(Color(#colorLiteral(red: 0.8447546363, green: 0.488882184, blue: 0.09081657976, alpha: 1)))
                    .cornerRadius(15)
                
                Spacer()
                
                ForEach(vm.cuisine, id: \.self) { cuisine in
                    
                    Button(action: {
                        
                    }, label: {
                        Text(cuisine.name)
                            .modifier(TextModifer(textStyle: .bold, size: 20))
                            .padding(.vertical)
                            .frame(width: viewWidth - 50)
                            .background(Color(#colorLiteral(red: 0.8447546363, green: 0.488882184, blue: 0.09081657976, alpha: 1)))
                            .cornerRadius(15)
                        
                    })
                    
                }
                Spacer()
            }
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

let viewWidth = UIScreen.main.bounds.width
