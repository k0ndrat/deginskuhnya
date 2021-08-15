    //
    //  ContentView.swift
    //  deginskuhnya
    //
    //  Created by Dima Kondratiev on 07.08.2021.
    //
    
    import SwiftUI
    
    struct ContentView: View {
        var body: some View {
            
            VStack {
                ZStack {
                    Image("logoblur")
                        .aspectRatio(contentMode: .fit)
                        .blur(radius: 2		)
                        
                        
                        .ignoresSafeArea()
                    VStack {
                        Text("SELECT YOUHES")
                            
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 300, height: 60, alignment: .center)
                            .background(Color(#colorLiteral(red: 0.8447546363, green: 0.488882184, blue: 0.09081657976, alpha: 1)))
                            .cornerRadius(15)
                            .shadow(radius: 20)
                            .padding(.bottom, 100)
                        
                        
                        
                        Button(action: {}, label: {
                            
                            
                            Text("ASIAN")
                                .font(.title2)
                                .fontWeight(.black)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .frame(width: 300, height: 90, alignment: .center)
                                .background(Color(#colorLiteral(red: 0.9799075723, green: 0.5699226856, blue: 0.08801174909, alpha: 1)))
                                .cornerRadius(20)
                                .padding()
                            
                        })
                        
                        
                        Button(action: {}, label: {
                            
                            Text("RUSSIAN")
                                .font(.title2)
                                .fontWeight(.black)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .frame(width: 300, height: 90, alignment: .center)
                                .background(Color(#colorLiteral(red: 0.9799075723, green: 0.5699226856, blue: 0.08801174909, alpha: 1)))
                                .cornerRadius(20)
                                .padding()
                        })
                        
                        
                        
                        Button(action: {}, label: {
                            
                            Text("AZERBAJAIN")
                                .font(.title2)
                                .fontWeight(.black)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .frame(width: 300, height: 90, alignment: .center)
                                .background(Color(#colorLiteral(red: 0.9799075723, green: 0.5699226856, blue: 0.08801174909, alpha: 1)))
                                .cornerRadius(20)
                                .padding()
                            
                            
                            
                        })
                        Text("UKRAINIAN")
                            .font(.title2)
                            .fontWeight(.black)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 300, height: 90, alignment: .center)
                            .background(Color(#colorLiteral(red: 0.9799075723, green: 0.5699226856, blue: 0.08801174909, alpha: 1)))
                            .cornerRadius(20)
                            .padding()
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
