//
//  ContentView.swift
//  All-Indie-SwiftUI
//
//  Created by Rebeca Pacheco on 18/01/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var notificationViewOpen = false

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
                        Button(action: {
                            withAnimation{
                                self.notificationViewOpen = !self.notificationViewOpen
                            }
                        }) {
                            Image(systemName:    "bell.fill").font(.system(size: 30)).foregroundColor(.black)
                        }
                    }.padding()
                    
                    CustomView()
                        .frame(height: notificationViewOpen ? 250 : 0)
                        .isHidden(!notificationViewOpen)
                    
                    VStack(spacing: 0){
                        VStack{
                            Image("capa2")
                                .resizable()
                                .frame(height: 485, alignment: .center)
                                .aspectRatio(contentMode: .fit)
//                                .padding(0)
                            Spacer()
                            
                            CustomView()
                                .padding(0)
                        }
                        
                    }
                    .cornerRadius(20)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black,lineWidth: 1.5))
                    Spacer()
                        .frame(height: 50)
                    
                    ForEach (data) {items in
                        ForEach (0 ..< 2) {item in
                            CollectionViewCell (data: items)
                        }
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
