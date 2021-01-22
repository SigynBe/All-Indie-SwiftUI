//
//  customView.swift
//  All-Indie-SwiftUI
//
//  Created by Rebeca Pacheco on 22/01/21.
//

import SwiftUI

struct CustomView: View {
    var body: some View {
        ZStack{
            
            Color(red: 1.00, green: 0.99, blue: 0.91, opacity: 1.00)
                .ignoresSafeArea()
        }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: 500, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: 167, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .border(Color.black)
    }
}

struct CustomView_Previews: PreviewProvider {
    static var previews: some View {
        CustomView().previewLayout(.sizeThatFits)
    }
}
