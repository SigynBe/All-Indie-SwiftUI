//
//  customView.swift
//  All-Indie-SwiftUI
//
//  Created by Rebeca Pacheco on 22/01/21.
//

import SwiftUI

struct customView: View {
    var body: some View {
        ZStack{
            
            Color.red.ignoresSafeArea()
        }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: 335, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: 177, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct customView_Previews: PreviewProvider {
    static var previews: some View {
        customView().previewLayout(.sizeThatFits)
    }
}
