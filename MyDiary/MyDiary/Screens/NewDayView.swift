//
//  NewDayView.swift
//  MyDiary
//
//  Created by Carlos Amaral on 01/01/22.
//

import SwiftUI

struct NewDayView: View {
    @Environment(\.managedObjectContext) var db
    
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
                Text("a")
            } // VSTACK
        } // ZSTACK
    }
}

struct NewDayView_Previews: PreviewProvider {
    static var previews: some View {
        NewDayView()
    }
}
