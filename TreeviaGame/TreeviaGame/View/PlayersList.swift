//
//  ContentView.swift
//  TreeviaGiulia
//
//  Created by Giulia Greta Cennamo on 03/06/23.
//

import SwiftUI

struct PlayersList: View
{
    @ObservedObject var myData = sharedData
    @State var isModalShowed:Bool=false
    @State var modalCheckUser:Bool=false
    
    var body: some View
    {
        NavigationStack
        {
            ZStack
            {
                bgColor
                    .ignoresSafeArea()
                    
                
                VStack{
                    Text("PLAYERS")
                        .font(.largeTitle)
                        .bold()
                        .fontWeight(.black)
                        .foregroundColor(colorOfQuestion)
                        .padding()
                    ScrollView
                    {
                        VStack
                        {
                            ForEach(myData.listOfUsers)
                            {
                                players in
                                
                                Button(action:{modalCheckUser=true}){ZStack(alignment:.leading)
                                    {
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(strokeColor,lineWidth:3)
                                            .frame(width: 350,height: 120)
                                            .background(Color.white)
                                            
                                        
                                        HStack{
                                            Image(players.imagePic).resizable().aspectRatio(contentMode:.fill).frame(width: 90, height: 90).padding(.leading)
                                            Spacer()
                                                .frame(width: 10)
                                            Text(players.nickname)
                                        .bold()
                                        .padding()
                                        .foregroundColor(.black)
                                                .font(.title3)
                                        }
                                }}.cornerRadius(15).padding(.vertical, 10.0)
                                    .sheet(isPresented:$modalCheckUser){
                                        CheckProfile(user: players)
                                        //MARK: ASK FOR HELP, IT ONLY SHOWS THE FIRST USER IN THE ARRAY
                                    }
                                    
                                //Applicatio alla zStack, quindi a tutto il bottone player
                                    
                                }
                            }
                            
                                    
                            
                        }.padding() //Padding sulla VStack, quindi tutta la colonna di players
                    Button(action: {
                        isModalShowed=true
                    }){
                        ZStack{
                            
                            Image(systemName: "plus.app.fill")
                                .resizable().frame(width: 40.0, height: 40.0).foregroundColor(strokeColor)
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(strokeColor, style: StrokeStyle(lineWidth:3,dash: [5]))
                                
                                .frame(width: 350,height: 120)
                        }
                        
                    }.sheet(isPresented:$isModalShowed){
                        CreateProfileView()
                    }
                }
                .padding()
                }
                
            }
        }
    }


struct PlayersList_Previews: PreviewProvider {
    static var previews: some View {
        PlayersList()
    }
}

//need to fill the buttons white, ad a shadow, dinamically change the images, controll the + button
