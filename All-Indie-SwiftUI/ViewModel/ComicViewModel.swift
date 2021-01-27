//
//  ComicViewModel.swift
//  All-Indie-SwiftUI
//
//  Created by Gonzalo Ivan Santos Portales on 27/01/21.
//

import Foundation

class ComicViewModel : ObservableObject {
    @Published var selectedComic : Comic!
    @Published var comics : [Comic] = [.init(id: "L: Hacker", imageName: "capa1"),.init(id: "Jão Wilkson", imageName: "capa2"),.init(id: "The Comrades - volume 1", imageName: "capa3"),.init(id: "The Comrades - volume 2", imageName: "capa4")]
        
    init() {
        self.selectedComic = Comic(id: "L: Hacker", imageName: "capa1")
    }
    
    func set(newSelectedComicOfIndex index : Int) {
        self.selectedComic = comics[index]
    }
}
