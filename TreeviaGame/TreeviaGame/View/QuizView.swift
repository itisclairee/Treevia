//
//  QuizView.swift
//  TreeviaGame
//
//  Created by Gennaro Iannicelli on 04/06/23.
//

import SwiftUI

struct Quiz1: View {
    //MARK: PROPERTIES
    @State var i:Int=0 //Number of questions
    @State var j:Int=0 //Number of players
    @State var isSelected:Bool=false
    @State var isCorrect:Bool=false

    let randomSequence:[Int]=getUniqueRandomNumbers(min: 0, max: 14, count: 10)
    var arrayOfPlayers:[Player]
    @State var scores:[Int]=[0,0,0,0]
    var body: some View {
        //MARK: BODY
        if(self.j<arrayOfPlayers.count){
            if(self.i<10){
                ZStack{
                    bgColor.ignoresSafeArea()
                    VStack{
                        
                    HStack{
                        Spacer()
                            .frame(width: 10)
                        Text("Treevia")
                            .foregroundColor(colorOfQuestion)
                            .font(.title)
                            .bold()
                        Spacer()
                        Text("\(self.i+1) out of 10")
                            .foregroundColor(colorOfQuestion)
                            .font(.title3)
                            .bold()
                    }
                        ProgressBar()
                            .onAppear{
                                DispatchQueue.main.asyncAfter(deadline: .now() + 50.0) {
                                    self.i=10
                                }
                            }
                        Spacer()
                            .frame(height:15)
            
                        Image(arrayOfPlayers[self.j].user.imagePic)
                            .resizable()
                            .frame(width:180,height: 180)
                        
                        HStack{
                            
                            Text("\(arrayOfPlayers[self.j].user.nickname)")
                           
                            Text("\(self.scores[self.j]) points")
                        }
                        .multilineTextAlignment(.center)
                        .bold()
                        .font(.title3)
                        .fixedSize(horizontal:false,vertical: true)
                        .foregroundColor((colorOfQuestion))
                        Text(myQuiz[randomSequence[self.i]].textQuestion)
                            .frame(width: 350,height: 150)
                        .multilineTextAlignment(.leading)
                        .bold().fontWeight(.black)
                        .font(.title)
                        .fixedSize(horizontal:false,vertical: true)
                        .foregroundColor(colorOfQuestion)
                        .minimumScaleFactor(0.3)
    
                        
                        
                    
                        ForEach(myQuiz[randomSequence[self.i]].answer){
                        risposta in
                            Spacer()
                                .frame(height:15)
                            HStack(spacing: 20){
                                Text(risposta.text)
                                    .bold()
                                if(isSelected){
                                    Spacer()
                                    
                                    Image(systemName: risposta.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                                        .foregroundColor(risposta.isCorrect ? Color.green : Color.red)
                                }
                        }
                            .multilineTextAlignment(.center)
                            .frame(width: 325,height:45)
                            .padding()
                            .bold()
                            .foregroundColor(isSelected ? risposta.isCorrect ? .white : wrongAnswerText : colorOfCorrectAnswer)
                            .font(.title3)
                            .fixedSize(horizontal:false,vertical: true)
                            .background(RoundedRectangle(cornerRadius: 20)
                                .fill(isSelected ? risposta.isCorrect ? colorOfQuestion : wrongAnswerBG : .white))
                            .onTapGesture {
                                isSelected=true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    // Put your code which should be executed with a delay here
                                    nextQuestion(isCorrect: risposta.isCorrect)
                                    isSelected=false

                                }
                                
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(isSelected ? risposta.isCorrect ? colorOfQuestion:wrongAnswerText:colorTextQuestion,lineWidth: 2)
                                    .shadow(radius:1)
                                    )
                            Spacer()
                                .frame(height: 5)
                        }
                        Spacer()
                            .frame(height: 60)
                }
                    
                }.navigationBarHidden(true)
            }else{
                EndOf10Questions(player: arrayOfPlayers[self.j], score: self.scores[self.j])
                    .onAppear{
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                            // Put your code which should be executed with a delay here
                            self.j=self.j+1
                            self.i=0
                        }
                        
                        
                    }
                    .navigationBarHidden(true)
            }
        }else{
            FinalView(player: arrayOfPlayers,score: self.scores)
                .navigationBarHidden(true)
        }
    }
    
func nextQuestion(isCorrect:Bool){
        if(isCorrect){
            self.scores[self.j]=self.scores[self.j]+1
        }
        
        self.i=self.i+1
    }

        //MARK: PREVIEW
    struct QuizView_Previews: PreviewProvider {
        static var previews: some View {
            Quiz1(arrayOfPlayers: [Player(user: User(nickname: "Savoiardo", imagePic: "picture4"),imagePic: "picture4")])
        }
    }
}
