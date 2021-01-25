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
            
            VStack{
                Spacer()
                    .frame(width: 20, height: 12)
                HStack(spacing: 20){
                    Spacer()
                        .frame(width: 0)
                    Button(action: {print("button tapped")}) {
                        Image("like").font(.system(size: 30)).foregroundColor(.black)
                    }
                    Button(action: {print("button tapped")}) {
                        Image("save").font(.system(size: 30)).foregroundColor(.black)
                    }
                    Button(action: {print("button tapped")}) {
                        Image("share").font(.system(size: 30)).foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                }
                
                Spacer()
                    .frame(width: 20, height: 20)
                
                HStack{
                    Spacer()
                        .frame(width: 20)
                    Text("Um amor assassino")
                        .font(.custom("Comic Book", size: 26))

                    Spacer()

                }
                HStack{
                    Spacer()
                        .frame(width: 20)
                    Text("by James Robinson Phil Elliott")
                    Spacer()
                }
                HStack{
                    Spacer()
                        .frame(width: 20)
                    Text("Um assassino percorrre a Europa...")
                    Spacer()
                }
                Spacer()
                    .frame(width: 20, height: 12)
            }
            
            
            }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: 500, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: 167, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
        
    }
}

struct CustomView_Previews: PreviewProvider {
    static var previews: some View {
       // CustomView().previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        CustomView().previewLayout(.sizeThatFits)
    }
}
