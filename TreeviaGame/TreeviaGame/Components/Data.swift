//
//  Data.swift
//  Treevia
//
//  Created by Gennaro Iannicelli on 30/05/23.
//

import SwiftUI

class SharedData: ObservableObject{
    
    //MARK: PICTURES
    @Published var Pictures:[String]=["picture1","picture2","picture3","picture4","picture5","picture6"]
    //MARK: QUESTIONS
   
    
    
    //MARK: USERS
    @Published var listOfUsers:[User]=[
        User(nickname: "PatataBollente",winningSentence: "I like trains", imagePic: "picture1")
    ]
        
    
    @Published var listOfPlayers:[Player]=[
        Player(user: User(nickname: "Player1",winningSentence: "AhAh, I Won!", imagePic: "picture1"),imagePic: ""),
        Player(user: User(nickname: "Player2",winningSentence: "AhAh, I Won!", imagePic: "picture2"),imagePic: ""),
        Player(user: User(nickname: "Player3",winningSentence: "AhAh, I Won!", imagePic: "picture3"),imagePic: ""),
        Player(user: User(nickname: "Player4",winningSentence: "AhAh, I Won!", imagePic: "picture4"),imagePic: ""),
    ]
    
}

var sharedData=SharedData()
