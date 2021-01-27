//
//  customView.swift
//  All-Indie-SwiftUI
//
//  Created by Rebeca Pacheco on 22/01/21.
//

import SwiftUI

struct CustomView: View {
    @State var notificationDropView = false
    
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
                    Text("Um assassino percorrre a Europa")
                    
                    Button(action: {
                        withAnimation{
                            self.notificationDropView = !self.notificationDropView
                        }
                    }){
                        Text("ver mais")
                            .foregroundColor(Color(UIColor(red: 0.38, green: 0.37, blue: 0.34, alpha: 1.00)
                            ))
                    }
                    
                        

                    Spacer()
                }
                Spacer()
                    .frame(width: 20, height: 80)
            }
            .border(Color.black)
            
            
            
        }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: 500, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: 167, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
        
    }
    
}

struct CustomView_Previews: PreviewProvider {
    static var previews: some View {
        CustomView().previewLayout(.sizeThatFits)
    }
}
