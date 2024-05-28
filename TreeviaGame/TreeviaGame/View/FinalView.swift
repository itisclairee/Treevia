//
//  FinalView.swift
//  TreeviaGame
//
//  Created by Gennaro Iannicelli on 04/06/23.
//

import SwiftUI
import AVFoundation

var player:AVAudioPlayer!


struct FinalView: View {
    var player:[Player]
    var score:[Int]
    @State var winnerIndex:Int=0
    var body: some View {
        NavigationLink(destination: ContentView()){
            ZStack{
                bgColor.ignoresSafeArea()
                Image(systemName: "crown.fill")
                    .resizable()
                    .frame(width: 200,height: 150)
                    .offset(y:-295)
                    .foregroundColor(.yellow)
                VStack{
                    Image(player[winnerIndex].user.imagePic)
                        .resizable()
                        .frame(width: 350,height: 350)
                        .padding()
                    VStack{
                        Text("\(player[winnerIndex].user.nickname) is our new Winner")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.black)
                        Text("Final score: \(score[winnerIndex])")
                            .font(.title2)
                            .bold()
                            .foregroundColor(colorOfQuestion)
                        Spacer()
                            .frame(height: 20)
                        Text("\(player[winnerIndex].user.winningSentence)")
                            .foregroundColor(colorOfQuestion)
                            .font(.title2)
                            .bold()
                    }
                    
                }
                
            }.onAppear{
                for index in 0...3{
                    if(score[index]>=score[winnerIndex]){
                    winnerIndex=index
                    }
                    playSound()
                    
                }
            }
            
        }

    }
}

func playSound(){
    let url=Bundle.main.url(forResource: "song", withExtension: "mp3")
    
    guard url != nil else{
        return
    }
    
    do{
        player=try AVAudioPlayer(contentsOf: url!)
        player?.play()
    }catch{
        print("\(error)")
    }
}

struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView(player: [Player(user: User(nickname: "Savoiardo", imagePic: "picture2"),imagePic: "picture2"),
                           Player(user: User(nickname: "Gennarino", imagePic: "picture3"),imagePic: "picture5")], score: [5,8,0,2])
    }
}
