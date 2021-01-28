//
//  ComicViewModel.swift
//  All-Indie-SwiftUI
//
//  Created by Gonzalo Ivan Santos Portales on 27/01/21.
//

import Foundation

// eu acho que vamos ter que quebrar essa view model em duas, uma view model pro user, e outra só pra comic, pq tá tudo uma zona nessa porra

class ComicViewModel : ObservableObject {
    
    @Published var selectedComic : Comic!
    @Published var savedComics : [Comic]!
    
    private var repository : CloudRepository!
    private var recommenderModel : MLRecommender!
    private var user : User = User() // eu n sei pq, mas eu instanciava o user na tora msm lá no app antigo, sabe deus como aquilo funcionava
    /*@Published var comics : [Comic] = [.init(id: "L: Hacker", imageName: "capa1"),.init(id: "Jão Wilkson", imageName: "capa2"),.init(id: "The Comrades - volume 1", imageName: "capa3"),.init(id: "The Comrades - volume 2", imageName: "capa4")]*/
        
    init(repository : CloudRepository, recommenderModel : MLRecommender) {
        self.repository = repository
        self.recommenderModel = recommenderModel
        
        repository.fetchSavedComics { (comics, errorMessage) in
            if let message = errorMessage {
                DispatchQueue.main.async {
                    print(message)
                }
            } else {
                self.savedComics = comics ?? []
                let recommendationTitle = self.recommenderModel.getRecommendation(for: self.user)
                print("A recomendação é \(recommendationTitle)")
                
                self.repository.getComic(title: recommendationTitle) { comic,message in // pelo amor de deus vamo mudar isso pra pelo menos devolver um Result, dps a gente passa pra Combine essa porra
                    DispatchQueue.main.async {
                        if let message = errorMessage {
                            DispatchQueue.main.async {
                                print(message)
                            }
                        } else {
                            self.set(selectedComic: comic!)
                            self.user.actualRecommendedComic = comic!
                            self.savedComics = comics ?? []
                        }
                    }
                }
            }
        }
    }
    
    // vamo ver qual das duas a gente muda
    func set(newSelectedComicOfIndex index : Int) {
        self.selectedComic = savedComics[index]
    }
    
    private func set(selectedComic : Comic) {
        self.selectedComic = selectedComic
    }
}
