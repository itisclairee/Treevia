//
//  Entities.swift
//  Treevia
//
//  Created by Gennaro Iannicelli on 31/05/23.
//

import SwiftUI

struct Answer:Identifiable{
    var id=UUID()
    var text:String
    var isCorrect:Bool
}

struct Question:Identifiable{
    var id=UUID()
    var question:String
    var answer:[String]
}

struct User:Identifiable{
    var id=UUID()
    var nickname:String
    var winningSentence:String="I will be the best"
    var imagePic:String
}


struct Player:Identifiable{
    var id=UUID()
    var user:User
    var imagePic:String=""
    var points:Int=0
}

struct questionIndex:Identifiable{
    var id=UUID()
    var question:Question
    var index:Int
}


struct quizModel{
    var textQuestion:String
    var answer:[Answer]
    var correct:Int
}

var myQuiz:[quizModel]=[
    quizModel(
    textQuestion: "What is the term for the practice of planting trees to restore or create forests?",
    answer: [
    Answer(text: "Afforestation", isCorrect: true),
    Answer(text: "Deforestation", isCorrect: false),
    Answer(text: "Urbanization", isCorrect: false)
    ],
    correct: 0
    ),
    quizModel(
    textQuestion: "Which of the following is a sustainable transportation option?",
    answer: [
    Answer(text: "Private Jet", isCorrect: false),
    Answer(text: "Electric Bicycle", isCorrect: true),
    Answer(text: "Diesel Truck", isCorrect: false)
    ],
    correct: 1
    ),
    quizModel(
    textQuestion: "What is the term for using resources in a way that meets the needs of the present without compromising the ability of future generations to meet their needs?",
    answer: [
    Answer(text: "Sustainability", isCorrect: true),
    Answer(text: "Consumerism", isCorrect: false),
    Answer(text: "Exhaustion", isCorrect: false)
    ],
    correct: 0
    ),
    quizModel(
    textQuestion: "Which of the following is a form of air pollution caused by burning fossil fuels?",
    answer: [
    Answer(text: "Acid Rain", isCorrect: true),
    Answer(text: "Ocean Acidification", isCorrect: false),
    Answer(text: "Eutrophication", isCorrect: false)
    ],
    correct: 0
    ),
    quizModel(
    textQuestion: "What is the term for reducing the amount of waste generated and sending less waste to landfills?",
    answer: [
    Answer(text: "Waste Management", isCorrect: false),
    Answer(text: "Waste Reduction", isCorrect: true),
    Answer(text: "Waste Disposal", isCorrect: false)
    ],
    correct: 1
    ),
    quizModel(
    textQuestion: "Which of the following is a renewable energy source?",
    answer: [
    Answer(text: "Coal", isCorrect: false),
    Answer(text: "Natural Gas", isCorrect: false),
    Answer(text: "Solar Power", isCorrect: true)
    ],
    correct: 2
    ),
    quizModel(
    textQuestion: "What is the process of converting waste materials into reusable materials called?",
    answer: [
    Answer(text: "Recycling", isCorrect: true),
    Answer(text: "Incineration", isCorrect: false),
    Answer(text: "Landfilling", isCorrect: false)
    ],
    correct: 0
    ),
    quizModel(
    textQuestion: "Which of the following is a greenhouse gas?",
    answer: [
    Answer(text: "Oxygen", isCorrect: false),
    Answer(text: "Nitrogen", isCorrect: false),
    Answer(text: "Carbon Dioxide", isCorrect: true)
    ],
    correct: 2
    ),
    quizModel(
    textQuestion: "What is the term for using a product or resource in a way that minimizes its impact on the environment?",
    answer: [
    Answer(text: "Sustainable", isCorrect: true),
    Answer(text: "Disposable", isCorrect: false),
    Answer(text: "Wasteful", isCorrect: false)
    ],
    correct: 0
    ),
    quizModel(
    textQuestion: "Which of the following is a sustainable farming practice?",
    answer: [
    Answer(text: "Monoculture", isCorrect: false),
    Answer(text: "Pesticide Use", isCorrect: false),
    Answer(text: "Crop Rotation", isCorrect: true)
    ],
    correct: 2
    ),
    quizModel(
    textQuestion: "What is the main cause of ozone depletion?",
    answer: [
    Answer(text: "Carbon Dioxide emissions", isCorrect: false),
    Answer(text: "Chlorofluorocarbons (CFCs)", isCorrect: true),
    Answer(text: "Deforestation", isCorrect: false)
    ],
    correct: 1
    ),
    quizModel(
    textQuestion: "What is the term for the gradual increase in Earth's average temperature due to human activities?",
    answer: [
    Answer(text: "Global Warming", isCorrect: true),
    Answer(text: "Climate Change", isCorrect: false),
    Answer(text: "Greenhouse Effect", isCorrect: false)
    ],
    correct: 0
    ),
    quizModel(
    textQuestion: "Which of the following is an example of single-use plastic?",
    answer: [
    Answer(text: "Reusable Water Bottle", isCorrect: false),
    Answer(text: "Plastic Straw", isCorrect: true),
    Answer(text: "Glass Jar", isCorrect: false)
    ],
    correct: 1
    ),
    quizModel(
    textQuestion: "What is the term for the process of converting organic waste into nutrient-rich soil?",
    answer: [
    Answer(text: "Composting", isCorrect: true),
    Answer(text: "Landfilling", isCorrect: false),
    Answer(text: "Incineration", isCorrect: false)
    ],
    correct: 0
    ),
    quizModel(
    textQuestion: "Which of the following is a renewable resource?",
    answer: [
    Answer(text: "Coal", isCorrect: false),
    Answer(text: "Wind Energy", isCorrect: true),
    Answer(text: "Natural Gas", isCorrect: false)
    ],
    correct: 1
    )
].shuffled()
