//
//  ComicViewModel.swift
//  All-Indie-SwiftUI
//
//  Created by Gonzalo Ivan Santos Portales on 27/01/21.
//

import Foundation
import UIKit

class ComicViewModel : ObservableObject {

    @Published var savedComics : [Comic]! = []
    @Published var notificationViewIsOpen = false
    @Published var selectedComic : Comic = .init(id: "1", title: "Hackermann", rating: 1.0, author: "Hazelous", description: "Léo é brabo demais mlk", cover: UIImage(named: "capa1"), isLiked: true, isSaved: true)
    
    private var repository : CloudRepository
    private var recommenderModel : MLRecommender
    private var user : User = User()
    
    init(repository : CloudRepository, recommenderModel : MLRecommender) {
        self.repository = repository
        self.recommenderModel = recommenderModel
        
        repository.fetchSavedComics { (comics, errorMessage) in // lembrar de mudar de volta pro fetchSavedComicsß
            if let message = errorMessage {
                DispatchQueue.main.async {
                    print(message)
                }
            } else {
                let recommendationTitle = self.recommenderModel.getRecommendation(for: self.user)
                
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
    
    func likeButtonPressed() {
        selectedComic.isLiked = !selectedComic.isLiked
        selectedComic.rating += selectedComic.isLiked ? 2.5 : -2.5
        
        if selectedComic.isSaved {
            repository.editComic(comic: self.selectedComic) { comic,errorMessage  in
                if let error = errorMessage {
                    DispatchQueue.main.async {
                        print(error)
                    }
                }
            }
        }
    }
    
    func saveButtonPressed() {
        selectedComic.isSaved = !selectedComic.isSaved
        
        if selectedComic.isSaved {
            selectedComic.rating += 2.5
            repository.saveComic(comic: selectedComic) { comic,errorMessage  in
                if let error = errorMessage {
                    DispatchQueue.main.async {
                        print(error)
                    }
                }
            }
            DispatchQueue.main.async {
                self.savedComics.append(self.selectedComic)
            }
            // salvar o comic na database privada
        } else {
            selectedComic.rating -= 2.5
            repository.removeComic(comic: selectedComic) { comic,errorMessage  in
                if let error = errorMessage {
                    DispatchQueue.main.async {
                        print(error)
                    }
                }
            }
            
            DispatchQueue.main.async {
                self.savedComics.removeAll { $0.title == self.selectedComic.title}
            }
            // remover o comic da database privada
        }
    }
    
    func changeNotificationViewState() {
        DispatchQueue.main.async {
            self.notificationViewIsOpen = !self.notificationViewIsOpen
        }
    }
    
    func saveComic(comicSave: Comic){
        repository.saveComic(comic: comicSave) { (comic, errorMenssager) in
            DispatchQueue.main.async {
                self.savedComics.append(comic!)
            }
        }
    }
    
    func set(selectedComic : Comic) {
        DispatchQueue.main.async {
            self.selectedComic = selectedComic
        }
    }
}
