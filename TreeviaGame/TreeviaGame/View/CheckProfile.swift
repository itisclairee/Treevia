//
//  CheckProfile.swift
//  TreeviaGame
//
//  Created by Gennaro Iannicelli on 05/06/23.
//

import SwiftUI


struct CheckProfile: View {
    var user:User
    @ObservedObject var myData=sharedData
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            bgColor.ignoresSafeArea()
            VStack{
                Image(user.imagePic)
                    .resizable()
                    .frame(width: 350,height: 350)
                    .padding()
                    .onAppear()
                VStack{
                    Text("Nickname: \(user.nickname)")
                        .font(.title2)
                        .bold()
                    Text("Winning: \(user.winningSentence)")
                        .font(.title2)
                        .bold()
                        .foregroundColor(colorOfQuestion)
                    Spacer()
                        .frame(height: 160)
                    Text("Delete User")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 100,height: 50)
                        .background(RoundedRectangle(cornerRadius: 50)
                            .fill(.red))
                        .onTapGesture {
                            myData.listOfUsers.remove(at: index(user: user))
                            dismiss()
                        }
                }
                
            }
        }
    }
    
    func index(user:User)->Int{
        var index:Int=0
        while(index<myData.listOfUsers.count-1 && myData.listOfUsers[index].id != user.id){
            index=index+1
        }
        return index
    }
}

struct CheckProfile_Previews: PreviewProvider {
    static var previews: some View {
        CheckProfile(user:User(nickname: "Savoiardo",winningSentence: "I'm the best of the best", imagePic: "picture5"))
    }
}
