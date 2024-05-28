//
//  ContentView.swift
//  Treevia
//
//  Created by Giovanni Miccio on 01/06/23.
//

import SwiftUI

struct ProgressBar: View {
    @State private var progress: Float = 0.0
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()// Initiate timer()
    
    
    var body: some View {
        VStack {
            ProgressView(value: progress, total: 50.0) //the progress value is increased by the start timer func
                .animation(.linear(duration: 50), value: true)
                .progressViewStyle(CustomProgressViewStyle())
                .edgesIgnoringSafeArea(.horizontal) // Ignore horizontal safe areas
                .padding(.horizontal, -16)
        
                .onAppear {//When the screen open start the timer
                            startTimer()
                        }
        
            
            
        }
        .padding()
    }
    
    func startTimer() { //timer func
        progress = 0.0 // Start from 0
        let totalDuration: Float = 50.0 // total duration
        
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            progress += 0.01 // increments timer of 0.01 every 0.01 seconds
            
            if progress >= totalDuration {
                timer.invalidate() // stops the timer at 10 sec
            }
        }
    }
    
    struct CustomProgressViewStyle: ProgressViewStyle { //custom progress bar style
        func makeBody(configuration: Configuration) -> some View {
            GeometryReader { geometry in
                ZStack(alignment: .leading) { //Two rectangles of the progress bar
                    Rectangle() //the one that is going to disappear
                        .foregroundColor(.green)
                        .frame(width: 393, height: 8)
                    Rectangle() //the one that is going to cover the visible one
                        .foregroundColor(.white)
                        .frame(width: geometry.size.width * CGFloat(configuration.fractionCompleted ?? 0), height: 8)
                    //the width is the total width multiplied for a fraction representing the bar space
                        
                }
            }
        }
        
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar()
    }
}
