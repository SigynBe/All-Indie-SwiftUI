//
//  CustomViewSaved.swift
//  All-Indie-SwiftUI
//
//  Created by Alessandro Negrão on 25/01/21.
//

import SwiftUI

struct CustomViewSaved: View {
    
    let data: [Comic] = [
       .init(id: "0", imageName: "capa1"),.init(id: "1", imageName: "capa2"),.init(id: "2", imageName: "capa3"),.init(id: "3", imageName: "capa4"),
   ]
    
    var body: some View {
        ZStack{
            Color(red: 1.00, green: 0.99, blue: 0.91, opacity: 1.00)
                .ignoresSafeArea()
            
            ForEach (data) {items in
                ForEach (0 ..< 2) {item in
                    CollectionView (data: [.init(id: "0", imageName: "capa1")])
                }
            }
        }
    }
    
}

struct CustomViewSaved_Previews: PreviewProvider {
    static var previews: some View {
        CustomViewSaved().previewLayout(.sizeThatFits)
    }
}
