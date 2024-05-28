//
//  EndOf10Questions.swift
//  TreeviaGame
//
//  Created by Gennaro Iannicelli on 04/06/23.
//

import SwiftUI

struct EndOf10Questions: View {
    var player:Player
    var score:Int
    var body: some View {
        ZStack{
            bgColor.ignoresSafeArea()
            VStack{
                Image(player.user.imagePic)
                    .resizable()
                    .frame(width: 350,height: 350)
                    .padding()
                HStack{
                    Text("\(player.user.nickname)")
                        .font(.title2)
                        .bold()
                    Spacer()
                        .frame(width: 40)
                    Text("Total points scored \(score)")
                        .bold()
                        .font(.title3)
                }
                
            }
        }
    }
}

struct EndOf10Questions_Previews: PreviewProvider {
    static var previews: some View {
        EndOf10Questions(player: Player(user: User(nickname: "Savoiardo",imagePic: "picture2"),imagePic: "picture2"), score: 5)
    }
}
