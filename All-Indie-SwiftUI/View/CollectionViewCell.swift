//
//  CollectionViewCell.swift
//  All-Indie-SwiftUI
//
//  Created by Rebeca Pacheco on 25/01/21.
//

import SwiftUI

struct CollectionViewCell: View {
    let data: DataModel
    
    var body: some View {
        VStack{
            HStack{
                ForEach (0..<2){items in
                    Spacer()
                    Image(self.data.imageName).resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 146).clipShape(Rectangle()).overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black,lineWidth: 2.5))
                    Spacer()
                    
                }.padding(.bottom, 16)
            }
            
        }
    }
    
}


struct CollectionViewCell_Previews: PreviewProvider {
    static var previews: some View {
        CollectionViewCell(data: .init(id: "1", imageName: "capa2"))
    }
}
