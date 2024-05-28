//
//  ContentView.swift
//  Treevia
//
//  Created by Chiara Cangelosi on 03/06/23.
//

import SwiftUI

struct ContentView: View
{
    //MARK: PROPERTIES
    @ObservedObject var myData = sharedData
    
    //MARK: BODY
   var body: some View
    {
        NavigationStack
        {
            
            ZStack
            {
                BackgroundColor.ignoresSafeArea()
                
                VStack
                {
                    Text("GO GREEN, LET'S QUIZ!")
                        .font(
                            .title)
                        .fontWeight(.black)
                        .bold()
                        .foregroundColor(TitleColor)
                        .padding(.horizontal,0.5)
                        .minimumScaleFactor(0.3)
                        .offset(y:-50)
                    
                    
                    
                    NavigationLink(destination:ChoosePlayers()){
                        ZStack
                        {
                            Rectangle().fill(RectangleColor).frame(width: 300,      height: 150).cornerRadius(30).shadow(color: .black, radius: 5, x: 0, y: 2)
                            Text("START")
                            .fontWeight(.black)
                            .foregroundColor(.white).bold()
                            .font(.title)
                            .shadow(radius: 10)
                            .offset(x:-50)
                            FirstImage.resizable().frame(width: 130, height: 130).offset(x: 85, y: -50)
                        }.padding(30)
                    }
                    
                    
                    
                    NavigationLink( destination:PlayersList()){
                        ZStack
                        {
                            Rectangle().fill(RectangleColor).frame(width: 300, height: 150).cornerRadius(30).shadow(color: .black, radius: 5, x: 0, y: 2)
                            
                            Text("PLAYERS").foregroundColor(.white).bold().font(.title)
                                .offset(x:-50)
                                .shadow(radius: 10)
                                .fontWeight(.black)
                            SecondImage.resizable().frame(width: 130, height: 130).offset(x: 85, y: -50)
                            
                        }.offset(y:30)
                    }
                    
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true)

    }
    
    
    


}


//MARK: PREVIEW
struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
