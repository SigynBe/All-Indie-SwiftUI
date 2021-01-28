//
//  ContentView.swift
//  All-Indie-SwiftUI
//
//  Created by Rebeca Pacheco on 18/01/21.
//

import SwiftUI

struct ContentView: View {
    @State var notificationViewOpen = false
    
    @ObservedObject var comicVM : ComicViewModel
    
    var body: some View {
        ZStack {
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
                    
                    NotificationView()
                        .frame(height: notificationViewOpen ? 400 : 0)
                        .isHidden(!notificationViewOpen).overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black,lineWidth: 1.5))
                    
                    Spacer().frame(height: 30)
                    
                    ComicView(comic: comicVM.selectedComic)
                    .cornerRadius(20)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black,lineWidth: 1.5))
                    
                    Spacer()
                        .frame(height: 30)
                    
                   VStack{
                        CollectionView(comicVM: comicVM)
                    }
                }
            }.padding(.bottom)
            .padding(.leading)
            .padding(.trailing)
        }
    }
}

/*struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(comicVM: .init()).previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
}*/
