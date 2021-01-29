//
//  NotificationView.swift
//  All-Indie-SwiftUI
//
//  Created by Alessandro Negrão on 26/01/21.
//

import SwiftUI

struct NotificationView: View {

    @ObservedObject var notificationVM : NotificationViewModel

    private let deviceWidth = UIScreen.main.bounds.width

    var body: some View {
        ZStack {
            Color(red: 1.00, green: 0.99, blue: 0.91, opacity: 1.00)
                .ignoresSafeArea()
            VStack {
                Text("Dias da Semana")
                    .font(.custom("Comic Book", size: 24))
                
                LazyHGrid(rows: [
                            GridItem(.flexible(minimum: 0, maximum: deviceWidth / CGFloat(notificationVM.weekDays.count)))],spacing: 15
                ) {
                    ForEach(0..<notificationVM.weekDays.count) { index in
                        DayView(day: notificationVM.weekDays[index]).onTapGesture {
                            notificationVM.weekDays[index].isSelected = !notificationVM.weekDays[index].isSelected
                        }
                    }
                }
                
                Text("Horário")
                    .font(.custom("Comic Book", size: 24))
            
                    DatePicker(
                            "Tá na hora ",
                        selection: $notificationVM.date,
                             //in: dateRange,
                             displayedComponents: [.hourAndMinute]
                        )
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
            }
            .cornerRadius(20)
//            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black,lineWidth: 1.5))
        }
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 120, maxWidth: 500, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(notificationVM: .init(notificationService:.init())).previewLayout(.sizeThatFits)
    }
}
