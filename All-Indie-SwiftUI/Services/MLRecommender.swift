//
//  MLService.swift
//  IndieComics
//
//  Created by Gonzalo Ivan Santos Portales on 15/06/20.
//  Copyright © 2020 Rebeca Pacheco. All rights reserved.
//

import Foundation

class MLRecommender {
    func getRecommendation(for user : User) -> String {
        let recommender = ComicRecommender()
        
        let ratings : [String: Double] = user.getRatedComics()
        let exclude = user.getExcludedComicsList()
        let restrict = CloudRepository().fetchFormatedData()
        
        let input = ComicRecommenderInput(items: ratings, k: 1, restrict_: restrict, exclude: exclude)
        
        do {
            let result = try recommender.prediction(input: input)
            return result.recommendations[0] 
        } catch {
            print("error")
        }
        
        return " "
    }
}
