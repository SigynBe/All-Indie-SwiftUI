//
//  NotificationView.swift
//  All-Indie-SwiftUI
//
//  Created by Alessandro Negrão on 26/01/21.
//

import SwiftUI

struct NotificationView: View {
    @State private var date = Date()

    var body: some View {
        
        let dateRange: ClosedRange<Date> = {
            let calendar = Calendar.current
            let startComponents = DateComponents(year: 2021, month: 1, day: 1)
            let endComponents = DateComponents(year: 2021, month: 12, day: 31, hour: 23, minute: 59, second: 59)
            return calendar.date(from:startComponents)!
                ...
                calendar.date(from:endComponents)!
        }()
        
        ZStack{
            Color(red: 1.00, green: 0.99, blue: 0.91, opacity: 1.00)
                .ignoresSafeArea()
            VStack{
                Text("Dias da Semana")
                    .font(.custom("Comic Book", size: 24))
                
                HStack{
                    Button(action: {print("button tapped")}) {
                        Image("S")
                    }
                    Button(action: {print("button tapped")}) {
                        Image("T")
                    }
                    Button(action: {print("button tapped")}) {
                        Image("Q")
                    }
                    Button(action: {print("button tapped")}) {
                        Image("Q")
                    }
                    Button(action: {print("button tapped")}) {
                        Image("S")
                    }
                    Button(action: {print("button tapped")}) {
                        Image("S")
                    }
                    Button(action: {print("button tapped")}) {
                        Image("D")
                    }
                }
                
                Text("Horário")
                    .font(.custom("Comic Book", size: 24))
                
               
                    DatePicker(
                            "Tá na hora ",
                             selection: $date,
                             in: dateRange,
                             displayedComponents: [.hourAndMinute]
                        )
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
            }
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black,lineWidth: 1.5))
           
        }
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: 500, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
        
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView().previewLayout(.sizeThatFits)
    }
}
