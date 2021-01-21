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
            Text("Scroll or not?").font(.largeTitle)
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: true){
                Image("capa").resizable().frame(height: 350, alignment: .center)
                Image("capa").resizable().frame(height: 350, alignment: .center)
                Image("capa").resizable().frame(height: 350, alignment: .center)
                Image("capa").resizable().frame(height: 350, alignment: .center)
                Image("capa").resizable().frame(height: 350, alignment: .center)
                Image("capa").resizable().frame(height: 350, alignment: .center)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
}
