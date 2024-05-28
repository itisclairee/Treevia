//
//  ImgPickerView.swift
//  Treevia
//
//  Created by Giovanni Miccio on 04/06/23.
//

import SwiftUI



    struct ImgPickerView: View {
        //MARK: Properties
        @Binding var selectedImage: String
        @Environment(\.presentationMode) var presentationMode //This is used to close the view on the avatar selection

        let avatarImages = [ //declaration of an avatar array
            "picture1",
            "picture2",
            "picture3",
            "picture4",
            "picture5",
            "picture6"
        ]
        
        //Declaration of the columns, how many rows, and how they behaves
        let columns: [GridItem] = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]

        var body: some View {
            NavigationView {
                ScrollView {
                    //This is an easy way of having a grid view based on the previous declared columns
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(avatarImages, id: \.self) { imageName in
                            Image(imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 170, height: 170)
                                .clipped()
                                .cornerRadius(25)
                                .padding(.top, 5)
                                .onTapGesture {
                                    selectedImage = imageName
                                    presentationMode.wrappedValue.dismiss()
                                }//when the image is selected close the view
                        }
                    }
                    .padding()
                }
                .navigationTitle("Choose an avatar:")
                
            }
        }
    }


struct ImgPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImgPickerView(selectedImage: .constant("avatar1")) // Fornisci un valore di esempio per selectedImage
    }
}
