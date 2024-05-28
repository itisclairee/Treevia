//
//  AnswerRow.swift
//  Treevia2
//
//  Created by Gennaro Iannicelli on 03/06/23.
//

import SwiftUI

struct AnswerRow: View {
    //MARK: PROPERTIES
    //Colori da cambiare -> testo (risposta giusta:bianco, risposta errata:wrongAnswerText
    //background(risposta giusta:colorOfQuestion, sbagliata:wrongAnswerBG
    var answer:Answer
    @State private var isSelected:Bool=false
    var body: some View {
    //MARK: VIEW
        HStack(spacing: 20){
            Text(answer.text)
            if(isSelected){
                Spacer()
                
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                    .foregroundColor(answer.isCorrect ? Color.green : Color.red)
            }
    }
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity)
        .padding()
        .bold()
        .foregroundColor(isSelected ? answer.isCorrect ? .white : wrongAnswerText : colorOfCorrectAnswer)
        .font(.title3)
        .fixedSize(horizontal:false,vertical: true)
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(isSelected ? answer.isCorrect ? colorOfQuestion : wrongAnswerBG : .white))
        .onTapGesture {
            isSelected=true
        }

        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(isSelected ? answer.isCorrect ? colorOfQuestion:wrongAnswerText:colorTextQuestion,lineWidth: 4)
                .shadow(radius: 3)
                )

    }
}
//MARK: PREVIEW
struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer:Answer(text: "", isCorrect: false))
    }
}
