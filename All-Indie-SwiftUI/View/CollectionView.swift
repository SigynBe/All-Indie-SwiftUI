//
//  CollectionViewCell.swift
//  All-Indie-SwiftUI
//
//  Created by Rebeca Pacheco on 25/01/21.
//

import SwiftUI

struct CollectionView: View {
    let data: [DataModel]
    private let deviceWidth = UIScreen.main.bounds.width
    
    
    var body: some View {
        
        LazyVGrid(columns: [
                    GridItem(.flexible(minimum: 0, maximum: deviceWidth / 2.1)),
                    GridItem(.flexible(minimum: 0, maximum: deviceWidth / 2.1))]
                  ) {
            ForEach((0..<data.count)) {index in
                Image(self.data[index].imageName).resizable().aspectRatio(contentMode: .fit).cornerRadius(20).clipShape(Rectangle()).overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black,lineWidth: 2.5)).padding(.horizontal)
            }
        }
        
    }
    
}


struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView(data: [.init(id: "0", imageName: "capa1")])
    }
}
