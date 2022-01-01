//
//  ContentView.swift
//  MyDiary
//
//  Created by Carlos Amaral on 01/01/22.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var db
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "data", ascending: false)]) var days : FetchedResults<Day>
    
    @State private var speed : Double = 5.0
    @State private var isEditing = false
    
    @State private var happy : Double = 5.0
    @State private var sad : Double = 1.0
    @State private var love : Double = 9.0
    
    var body: some View {
        NavigationView {
            ZStack {
                
                //MARK: BACKGROUND
                LinearGradient(
                    colors: [Color.blue, Color.green],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                    .edgesIgnoringSafeArea(.all)
                
                
                VStack {
                    //MARK: MAIN BANNER
                    VStack {
                        Section(
                            header:
                                HStack {
                                    Text("Happy")
                                        .foregroundColor(.gray)
                                    Spacer()
                                }
                        ){
                            Slider(value: $happy, in: 0...10)
                        }
                        
                        Section(
                            header:
                                HStack {
                                    Text("Love")
                                        .foregroundColor(.gray)
                                    Spacer()
                                }
                        ){
                            Slider(value: $sad, in: 0...10)
                        }
                        
                        Section(
                            header:
                                HStack {
                                    Text("Sad")
                                        .foregroundColor(.gray)
                                    Spacer()
                                }
                        ){
                            Slider(value: $love, in: 0...10)
                        }
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(15)
                    .padding()
                    
                    
                    //MARK: LIST
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(days) { day in
                                VStack(alignment: .leading, spacing: 10) {
                                    Text("\(day.data!)")
                                        .foregroundColor(.gray)
                                        .fontWeight(.bold)
                                        .padding(.vertical)
                                        .padding(.horizontal)
                                    
                                    HStack {
                                        Text("😃")
                                        
                                        HStack {
                                            Text("\(day.happy.formatted()) / 10")
                                                .font(.body)
                                                .fontWeight(.bold)
                                        }
                                    }
                                    .foregroundColor(.gray)
                                    
                                    HStack {
                                        Text("🥰")
                                        
                                        HStack {
                                            Text("\(day.love.formatted()) / 10")
                                                .font(.body)
                                                .fontWeight(.bold)
                                        }
                                    }
                                    .foregroundColor(.gray)
                                    
                                    HStack {
                                        Text("😔")
                                        
                                        HStack {
                                            Text("\(day.sad.formatted()) / 10")
                                                .font(.body)
                                                .fontWeight(.bold)
                                        }
                                    }
                                    .foregroundColor(.gray)
                                }
                                .padding()
                                .background(.white)
                                .cornerRadius(15)
                            }
                            .padding(.leading)
                        }
                    }
                    
                    Spacer()
                }
            }
            .navigationTitle("My Diary")
            .navigationBarItems(
                trailing:
                    Image(systemName: "plus")
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
