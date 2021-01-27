//
//  CollectionView.swift
//  All-Indie-SwiftUI
//
//  Created by Rebeca Pacheco on 25/01/21.
//

import SwiftUI

struct CollectionView: View {
    
    @ObservedObject var comicVM : ComicViewModel
    private let deviceWidth = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack{
            ZStack{
                Color(red: 1.00, green: 0.99, blue: 0.91, opacity: 1.00)
                    .ignoresSafeArea()
                VStack{
                    Spacer().frame(height: 100)
                    
                    LazyVGrid(columns: [
                                GridItem(.flexible(minimum: 0, maximum: deviceWidth / 2.1)),
                                GridItem(.flexible(minimum: 0, maximum: deviceWidth / 2.1))]
                    ) {
                        ForEach(0..<comicVM.comics.count) { index in
                            ComicGridCellView(comic: comicVM.comics[index]).onTapGesture {
                                comicVM.set(newSelectedComicOfIndex: index)
                            }
                        }
                    }
                    Spacer().frame(height: 20)
                }
            }.cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black,lineWidth: 1.5))
            
            Spacer()
                .frame(height: 30)
            
            HStack{
                Image("Salvos")
                Spacer()
            }.position(x: 183.0, y: 25.0)
        }
    }
}


struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView(comicVM: .init())
    }
}
