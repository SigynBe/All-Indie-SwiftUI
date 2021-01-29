//
//  ComicView.swift
//  All-Indie-SwiftUI
//
//  Created by Gonzalo Ivan Santos Portales on 26/01/21.
//

import SwiftUI

struct ComicView: View {
    @ObservedObject var comicVM : ComicViewModel
    var comic : Comic
    
    init(comic: Comic, comicVM: ComicViewModel) {
        self.comic = comic
        self.comicVM = comicVM
    }
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                Image(uiImage: comic.cover!)
                    .resizable()
                    .frame(height: 485, alignment: .center)
                    .aspectRatio(contentMode: .fit)

                ComicDetailsView(comic: comic, comicVM: comicVM)
                    .padding(0)
            }
        }
        .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black,lineWidth: 1.5))    }
}

/*struct ComicView_Previews: PreviewProvider {
    static var previews: some View {
        ComicView(comic: .)
    }
}*/
