//
//  ComicViewModel.swift
//  All-Indie-SwiftUI
//
//  Created by Gonzalo Ivan Santos Portales on 27/01/21.
//

import Foundation
import UIKit

// eu acho que vamos ter que quebrar essa view model em duas, uma view model pro user, e outra só pra comic, pq tá tudo uma zona nessa porra

class ComicViewModel : ObservableObject {
    
    @Published var selectedComic : Comic!
    @Published var savedComics : [Comic]!
    @Published var notificationViewIsOpen = false
    
    private var repository : CloudRepository!
    private var recommenderModel : MLRecommender!
    private var user : User = User() // eu n sei pq, mas eu instanciava o user na tora msm lá no app antigo, sabe deus como aquilo funcionava
    
    init(repository : CloudRepository, recommenderModel : MLRecommender) {
        self.repository = repository
        self.recommenderModel = recommenderModel
        self.selectedComic = .init(id: "dsafd", title: "fasjhdgfj", rating: 1.0, author: "dsfahsgdj", description: "dsahjfghjsdghjf", cover: UIImage(named: "capa1"), isLiked: true, isSaved: true)
        self.savedComics = []
        
        repository.fetchSavedComics { (comics, errorMessage) in // lembrar de mudar de volta pro fetchSavedComicsß
            if let message = errorMessage {
                DispatchQueue.main.async {
                    print(message)
                }
            } else {
                let recommendationTitle = self.recommenderModel.getRecommendation(for: self.user)
                print("A recomendação é \(recommendationTitle)")
                
                self.repository.getComic(title: recommendationTitle) { comic,message in // pelo amor de deus vamo mudar isso pra pelo menos devolver um Result, dps a gente passa pra Combine essa porra
                    DispatchQueue.main.async {
                        if let message = errorMessage {
                            print(message)
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
    
    func changeNotificationViewState() {
        notificationViewIsOpen = !notificationViewIsOpen
    }
    
    func saveComic(comicSave: Comic){
        repository.saveComic(comic: comicSave) { (comic, errorMenssager) in
            DispatchQueue.main.async {
                self.savedComics.append(comic!)
            }
        }
    }
    
    func set(selectedComic : Comic) {
        self.selectedComic = selectedComic
    }
}
