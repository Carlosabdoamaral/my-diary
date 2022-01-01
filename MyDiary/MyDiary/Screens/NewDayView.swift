//
//  NewDayView.swift
//  MyDiary
//
//  Created by Carlos Amaral on 01/01/22.
//

import SwiftUI

struct NewDayView: View {
    @Environment(\.managedObjectContext) var db
    @StateObject private var dataController = DataController()
    
    @State private var happy : Double = 0.00
    @State private var love : Double = 0.00
    @State private var sad : Double = 0.00
    
    @State private var title : String = ""
    @State private var desc : String = ""
    @State private var data : Date = Date()
    
    var body: some View {
        ZStack {
            //MARK: BACKGROUND
            LinearGradient(
                colors: [Color.blue, Color.green],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)
            
            //MARK: BODY
            VStack {
                
                
                //MARK: SLIDERS
                VStack {
                    VStack(alignment: .leading) {
                        Text("Happy")
                        Slider(value: $happy, in: 0...10)
                    } // VSTACK

                    VStack(alignment: .leading) {
                        Text("Love")
                        Slider(value: $love, in: 0...10)
                    } // VSTACK
                    
                    VStack(alignment: .leading) {
                        Text("Sad")
                        Slider(value: $sad, in: 0...10)
                    } // VSTACK
                    
                } // VSTACK
                .padding()
                .background(.white)
                .foregroundColor(.gray)
                .cornerRadius(15)
                .padding()
                
                VStack {
                    
                    TextField("Give a title", text: $title)
                        .padding()
                        .background()
                        .cornerRadius(5)
                    
                    TextField("Give a description", text: $desc)
                        .padding()
                        .background()
                        .cornerRadius(5)
                    
                    DatePicker("Date", selection: $data)
                        .padding()
                        .background()
                        .cornerRadius(5)
                } // FORM - VSTACK
                .padding()
                .background(.white)
                .foregroundColor(.gray)
                .cornerRadius(15)
                .padding()
                
                
                Button ("Add") {
                    let newDay = Day(context: db)
                    newDay.id = UUID()
                    newDay.sad = self.sad
                    newDay.love = self.love
                    newDay.happy = self.happy
                    newDay.data = self.data
                    newDay.title = self.title
                    newDay.desc = self.desc
                    
                    try? db.save()
                }
                .padding()
                .padding(.horizontal)
                .background()
                .cornerRadius(5)
                
                Spacer()
                
            } // VSTACK
        } // ZSTACK
        .colorScheme(.light)
    }
}

struct NewDayView_Previews: PreviewProvider {
    static var previews: some View {
        NewDayView()
    }
}
