//
//  customView.swift
//  All-Indie-SwiftUI
//
//  Created by Rebeca Pacheco on 22/01/21.
//

import SwiftUI

struct ComicDetailsView: View {
    
    @ObservedObject var comicVM : ComicViewModel
    
    init(comicVM: ComicViewModel) {
        self.comicVM = comicVM
    }
    
    var body: some View {
        ZStack {
            Color(red: 1.00, green: 0.99, blue: 0.91, opacity: 1.00)
                .ignoresSafeArea()
            VStack {
                Spacer()
                    .frame(width: 20, height: 20)
                
                HStack(spacing: 20) {
                    Spacer()
                        .frame(width: 0)
                    Button(action: {comicVM.likeButtonPressed()}) {
                        Image("like").font(.system(size: 30)).foregroundColor(.black)
                    }
                    Button(action: {comicVM.saveButtonPressed()}) {
                        Image("save").font(.system(size: 30)).foregroundColor(.black)
                    }
                    Button(action: {print("button tapped")}) {
                        Image("share").font(.system(size: 30)).foregroundColor(.black)
                    }
                    
                    Spacer()
                }
                
                Spacer()
                    .frame(width: 20, height: 10)
                
                HStack {
                    Spacer()
                        .frame(width: 20)
                    Text(comicVM.selectedComic.title)
                        .font(.custom("Comic Book", size: 26))

                    Spacer()

                }
                HStack {
                    Spacer()
                        .frame(width: 20)
                    Text(comicVM.selectedComic.author)
                    Spacer()
                }
                HStack {
                    Spacer()
                        .frame(width: 20)
                    Text(comicVM.selectedComic.description)
                    Spacer()
                }
                Spacer()
                    .frame(width: 20, height: 50)
            }
            .border(Color.black)
        }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: 500, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: 167, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct ComicDetailsView_Previews: PreviewProvider {
    static var previews: some View {
       // CustomView().previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        ComicDetailsView(comicVM: .init(repository: .init(), recommenderModel: .init())).previewLayout(.sizeThatFits)
    }
}
