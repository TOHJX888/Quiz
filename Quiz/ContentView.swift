//
//  ContentView.swift
//  Quiz
//
//  Created by RGS on 27/5/23.
//

import SwiftUI


struct ContentView: View {
    let questions = [
        Question(q: "What is the day today?", o1: "Monday", o2: "Saturday", o3: "Wednesday", o4: "Friday"),
        Question(q: "Which is a Taylor Swift's song?", o1: "Fire", o2: "Love Story", o3: "Dope", o4: "I Need You"),
        Question(q: "What programme are you in?", o1:"Swifties' Club", o2:"Swift Accelerator's Programme", o3: "Fast and Swift", o4:"Suzuki Swift's programme")
    ]
    @State private var index = 0
    @State private var isCorrect = false
    @State private var showAlert = false
    @State private var showSheet = false
    @State private var score = 0
    
    var body: some View {
        VStack{
            Text(questions[index].q)
            HStack{
                Button{
                    isCorrect = false
                    showAlert = true
                } label: {
                    Text(questions[index].o1)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.blue)
                }
                Button{
                    isCorrect = true
                    showAlert = true
                    score += 1
                } label: {
                    Text(questions[index].o2)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.blue)
                }
                
            } .multilineTextAlignment(.center)
            HStack{
                Button{
                    isCorrect = false
                    showAlert = true
                } label: {
                    Text(questions[index].o3)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.blue)
                }
                Button{
                    isCorrect = false
                    showAlert = true
                } label: {
                    Text(questions[index].o4)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.blue)
                }
                
            } .multilineTextAlignment(.center)
            
        }
            .alert(isCorrect ? "Correct!!!" : "Wrong!", isPresented: $showAlert) {
                Button ("Next Question"){
                  index += 1
                    if index == questions.count {
                        showSheet = true
                        index = 0
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                Text("Your score is \(score)/\(questions.count)")
                if score <= 1 {
                    Text("Wow, you are bad at this!")
                }
        }
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

