//
//  CreateProfileView.swift
//  Treevia
//
//  Created by Giovanni Miccio on 01/06/23.
//

import SwiftUI
//MARK: The preview looks strange, but since it's a modal, on actual simulator it's okay
struct CreateProfileView: View {
    //MARK: Properties
    @State private var name = ""
    @State private var winning = ""
    @State private var selectedImage: String = ""
    @State private var showImagePicker: Bool = false
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var myData = sharedData

    
    var body: some View {
            VStack {
                // Upper part with heading
                ZStack {
                    bgColor//MARK: change color
                        .frame(height: UIScreen.main.bounds.height / 5) // height being 1/4 of the screen
                        .padding(.top,230)
                    Text("ADD A PLAYER")
                        .font(.system(size: 35, weight: .bold))
                        .fontWeight(.black)
                        .foregroundColor(colorOfQuestion)
                        .padding(.top,280)

                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                
                // Bottom part
                ZStack {
                    bgColor //MARK: change color
                    ScrollView{
                        
                        VStack {
                            //Image picker
                            Button(action: {
                                showImagePicker = true
                                
                            }) {
                                //placeholder image
                                if selectedImage.isEmpty {
                                    Image(myData.Pictures[0])
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 200, height: 200)
                                        .clipped()
                                        .cornerRadius(25)
                                        .padding(.top,10)
                                }
                                //selected image
                                else {
                                    Image(selectedImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 200, height: 200)
                                        .clipped()
                                        .cornerRadius(25)
                                        .padding(.top, 10)
                                }
                            }
                            //Open image picker modal
                            .sheet(isPresented: $showImagePicker) {
                                ImgPickerView(selectedImage: $selectedImage)
                            }
                            
                            
                            //name field
                            Text("NAME")
                                .padding(.trailing, 290)
                                .padding(.top, 20)
                                .foregroundColor(colorOfQuestion)
                                .bold()
                            TextField("Type a Name...", text: $name)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.top, -18)
                                .padding()
                                .shadow(radius: 5)
                            
                            //winning field
                            Text("VICTORY MOTTO")
                                .padding(.trailing, 205)
                                .lineLimit(1)
                                .frame(maxWidth: 350)
                                .padding(.top, 10)
                                .foregroundColor(colorOfQuestion)
                                .bold()
                            TextField("Type a winning sentence...", text: $winning)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.top, -18)
                                .padding()
                                .shadow(radius: 5)
                            
                            //Button to save and close the screen
                            Spacer()
                                .frame(height: 10)
                            Button(action: {
                                //on press close modal and add player
                                myData.listOfUsers.append(User(nickname: name,winningSentence:winning, imagePic: selectedImage))
                                dismiss()
                                //modal close
                            }) {
                                Text("SAVE")
                                    .font(.system(size: 25, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(colorOfQuestion)
                                    .cornerRadius(10)
                            }
                        }.onAppear{
                            selectedImage=myData.Pictures[0]
                        }
                    }
                }
                .frame(height: 914)
                .padding(.top, -10)

            }.ignoresSafeArea(.keyboard) //this and the scroll view, thanks to the height of the VStack, makes possible that on the opening of the keyboard the twxt field is not covered
            .edgesIgnoringSafeArea(.all)
        
    }
    
    //MARK: change datas or names according to player datas in the main project
    func addPlayer(name: String, winning: String, image: String){
        
        let addUser = User(nickname: name,winningSentence: winning,imagePic: image)
        myData.listOfUsers.append(addUser)
    }
}





struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileView()
    }
}
