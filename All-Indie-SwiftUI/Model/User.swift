//
//  User.swift
//  IndieComics
//
//  Created by Gonzalo Ivan Santos Portales on 15/06/20.
//  Copyright © 2020 Rebeca Pacheco. All rights reserved.
//

import Foundation

class User {
    var userID : String = ""
    var actualRecommendedComic : Comic!
    var savedComics : [Comic] = []
    var excludedComics : [Comic] = []
    
    func getExcludedComicsList() -> [String] {
        var restrictedComics : [String] = []
        
        for comic in savedComics {
            restrictedComics.append(comic.title)
        }
        
        for comic in excludedComics {
            restrictedComics.append(comic.title)
        }
        
        return restrictedComics
    }
    
    func getRatedComics() -> [String : Double] {
        var ratedComics : [String : Double] = [:]
        
        for comic in savedComics {
            ratedComics[comic.title] = comic.rating
        }
        
        return ratedComics
    }
}
