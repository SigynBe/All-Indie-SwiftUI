//
//  ComicGridCellView.swift
//  All-Indie-SwiftUI
//
//  Created by Gonzalo Ivan Santos Portales on 25/01/21.
//

import SwiftUI

struct ComicGridCellView: View {
    private var comic : Comic
    
    init(comic : Comic) {
        self.comic = comic
    }
    
    var body: some View {
        Image(uiImage: comic.cover!)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(20)
            .clipShape(Rectangle())
            .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black,lineWidth: 2.5)).padding(.horizontal)
    }
}

/*struct ComicGridCellView_Previews: PreviewProvider {
    static var previews: some View {
        ComicGridCellView(comic: .init(id: "0", imageName: "capa1"))
    }
}*/
