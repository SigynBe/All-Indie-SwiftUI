//
//  ContentView.swift
//  All-Indie-SwiftUI
//
//  Created by Rebeca Pacheco on 18/01/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
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
                Image("capa").resizable().frame(height: 600, alignment: .center)
                Image("capa").resizable().frame(height: 600, alignment: .center)
                Image("capa").resizable().frame(height: 600, alignment: .center)
                Image("capa").resizable().frame(height: 600, alignment: .center)
                Image("capa").resizable().frame(height: 600, alignment: .center)
                Image("capa").resizable().frame(height: 600, alignment: .center)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
}
