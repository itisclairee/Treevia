//
//  ContentView.swift
//  TreeviaGiulia
//
//  Created by Giulia Greta Cennamo on 03/06/23.
//

import SwiftUI

struct ChoosePlayers: View
{
    @State var arrayOfPlayers:[Player]=[]
    @ObservedObject var myData = sharedData
    @State var numberOfPlayers:Int=0
    var disableButton:Bool=false

    var body: some View
    {
            ZStack
            {
                bgColor
                    .ignoresSafeArea()
                    
                
                VStack{
                    Spacer()
                        .frame(height: 30)
                    Text("WHO'S PLAYING?")
                        .font(.largeTitle)
                        .bold()
                        .fontWeight(.black)
                        .foregroundColor(colorOfQuestion)
                    ScrollView
                    {
                        VStack
                        {
                            ForEach(myData.listOfUsers)
                            {
                                users in
                                
                                Button(action:{numberOfPlayers=numberOfPlayers+1
                                    
                                    arrayOfPlayers.append(Player(user: users, points: 0))
                                }){ZStack(alignment:.leading)
                                    {
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(strokeColor,lineWidth:7)
                                            .frame(width: 350,height: 120)
                                            .background(Color.white)
                                            
                                        
                                        HStack{
                                            Image(users.imagePic).resizable().aspectRatio(contentMode:.fill).frame(width: 90, height: 90).padding(.leading)
                                            Spacer()
                                                .frame(width: 10)
                                            Text(users.nickname).bold().padding(.leading)
                                                .foregroundColor(.black)
                                                .font(.title3)
                                        }
                                }}.cornerRadius(15).padding(.vertical, 10.0)
                                    .disabled(numberOfPlayers==4)
                                    //Applicatio alla zStack, quindi a tutto il bottone player
                                    
                                }
                            
                            }
                            
                        
                                    
                            
                        }.padding() //Padding sulla VStack, quindi tutta la colonna di players
                    
                    Text("Required min 2 players").bold().padding().font(.title3)
                    
                    Text("Players Selected \(numberOfPlayers)/4")
                        .bold()
                        .font(.title3)
                    Spacer()
                        .frame(height: 30)
                    NavigationLink(destination: Quiz1(arrayOfPlayers:arrayOfPlayers)){
                            
                        

                        
                       
                        
                        
                            Text("Let's play")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                                .background{
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(colorOfQuestion)
                                        .frame(width: 150,height: 60)
                                }
                            
                                
                    }.disabled(numberOfPlayers<2 || numberOfPlayers>4)
                    Spacer()
                        .frame(height: 30)
                }
                
            }
        }
    }

struct ChoosePlayers_Previews: PreviewProvider {
    static var previews: some View {
        ChoosePlayers()
    }
}

//need to fill the buttons white, ad a shadow, dinamically change the images, controll the + button
