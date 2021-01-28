//
//  DataModel.swift
//  All-Indie-SwiftUI
//
//  Created by Rebeca Pacheco on 25/01/21.
//

import Foundation
import SwiftUI

struct Comic: Identifiable {
    var id: String
    var title : String = ""
    var rating : Double = 0.0
    var author : String = ""
    var description : String = ""
    var cover : UIImage?
    var isLiked : Bool = false
    var isSaved : Bool = false
}
