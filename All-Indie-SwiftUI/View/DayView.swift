//
//  DayView.swift
//  All-Indie-SwiftUI
//
//  Created by Gonzalo Ivan Santos Portales on 28/01/21.
//

import SwiftUI

struct DayView: View {
    
    let day : Day

    init(day : Day) {
        self.day = day
    }
    
    var body: some View {
        ZStack {
            if day.isSelected {
                Circle().fill(Color.red).frame(width: 30, height: 40)
            }
            Text(day.daySymbol).font(.custom("Comic Book", size: 21))
        }
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(day: .init(daySymbol: "S", isSelected: true, index: 1))
    }
}
