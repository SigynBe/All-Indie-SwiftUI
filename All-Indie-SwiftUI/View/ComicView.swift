//
//  ComicView.swift
//  All-Indie-SwiftUI
//
//  Created by Gonzalo Ivan Santos Portales on 26/01/21.
//

import SwiftUI

struct ComicView: View {
    
    var comic : Comic
    
    init(comic: Comic) {
        self.comic = comic
    }
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                Image(comic.imageName)
                    .resizable()
                    .frame(height: 485, alignment: .center)
                    .aspectRatio(contentMode: .fit)

                CustomView(comic: comic)
                    .padding(0)
            }
            
        }
        .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black,lineWidth: 1.5))    }
}

struct ComicView_Previews: PreviewProvider {
    static var previews: some View {
        ComicView(comic: .init(id: "L: Hacker", imageName: "capa1"))
    }
}
