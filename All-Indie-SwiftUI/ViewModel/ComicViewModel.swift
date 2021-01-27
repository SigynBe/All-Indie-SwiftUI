//
//  ComicViewModel.swift
//  All-Indie-SwiftUI
//
//  Created by Gonzalo Ivan Santos Portales on 27/01/21.
//

import Foundation

class ComicViewModel : ObservableObject {
    @Published var selectedComic : Comic!
    @Published var comics : [Comic] = [.init(id: "0", imageName: "capa1"),.init(id: "1", imageName: "capa2"),.init(id: "2", imageName: "capa3"),.init(id: "3", imageName: "capa4")]
    
    var aux = "botei isso só pra poder subir de novo"
    
    init() {
        self.selectedComic = Comic(id: "1", imageName: "capa1")
    }
    
    func set(newSelectedComicOfIndex index : Int) {
        self.selectedComic = comics[index]
    }
}
