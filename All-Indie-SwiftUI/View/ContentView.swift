//
//  ContentView.swift
//  All-Indie-SwiftUI
//
//  Created by Rebeca Pacheco on 18/01/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack{
            Color(red: 1.00, green: 1.00, blue: 0.96, opacity: 1.00)
                .ignoresSafeArea()
            VStack(){
                ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: true){
                    HStack{
                        VStack(alignment: .leading){
                            Image("hoje")
                        }
                        Spacer()
                        Button(action: {print("button tapped")}) {
                            Image(systemName: "bell.fill").font(.system(size: 30)).foregroundColor(.black)
                        }
                    }.padding()
                    VStack(spacing: 0){
                        Image("capa")
                            .resizable()
                            .frame(height: 485, alignment: .center)
                            .padding(0)
                        CustomView().padding(0)
                    }
                   
                }.padding(.bottom)
                .padding(.leading)
                .padding(.trailing)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
}
