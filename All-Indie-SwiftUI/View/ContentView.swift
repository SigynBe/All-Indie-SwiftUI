//
//  ContentView.swift
//  All-Indie-SwiftUI
//
//  Created by Rebeca Pacheco on 18/01/21.
//

import SwiftUI

struct ContentView: View {
    let data: [DataModel] = [
        .init(id: "0", imageName: "capa1"),.init(id: "1", imageName: "capa2"),.init(id: "2", imageName: "capa3"),.init(id: "3", imageName: "capa4"),
    ]
    
    
    var body: some View {
        
        ZStack{
            Color(red: 1.00, green: 1.00, blue: 0.96, opacity: 1.00)
                .ignoresSafeArea()
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: true){
                VStack(spacing: 0){
                    HStack{
                        Image("hoje")
                        Spacer()
                        Button(action: {print("button tapped")}) {
                            Image(systemName:    "bell.fill").font(.system(size: 30)).foregroundColor(.black)
                        }
                    }
                    Spacer()
                        .frame(height: 26)
                    VStack{
                        Image("capa1")
                            .resizable()
                            .frame(height: 485, alignment: .center)
                            .padding(0)
                        
                        CustomView()
                            .padding(0)
                    }
                }.padding()
                
                List {
                    ForEach (data) {items in
                        ForEach (0 ..< 2) {item in
                            CollectionViewCell (data: items)
                        }
                    }
                }
                
            }.padding(.bottom)
            .padding(.leading)
            .padding(.trailing)
            
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
}
