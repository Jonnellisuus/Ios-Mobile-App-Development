//
//  FriendDetailsView.swift
//  CameraSwiftUI
//
//  Created by Jonne Kiukas on 12.2.2021.
//

import SwiftUI

struct FriendDetailsView: View {
    var friend: Friend
    
    @State var showImagePicker: Bool = false
    @State var showActionSheet: Bool = false
    @State var image: Image?
    @State var sourceType: Int = 0
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    image?
                        .resizable()
                        .clipped()
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 160, height: 160)
                        .overlay(
                            CameraButtonView(showActionSheet: $showActionSheet)
                                .offset(x: 50, y: 65)
                        )
                    
                    Text(friend.name)
                        .font(.system(size: 40))
                        .background(Color.black)
                        .foregroundColor(.white)
                }.offset(y: 60)
                Spacer()
            }
            .actionSheet(isPresented: $showActionSheet, content: { () -> ActionSheet in ActionSheet(title: Text("Select Image"), message: Text("Please select an image from the image gallery or use the camera"), buttons: [ActionSheet.Button.default(Text("Camera"), action: {
                self.sourceType = 0
                self.showImagePicker.toggle()
                    }),
                    ActionSheet.Button.default(Text("Photo Gallery"), action: {
                        self.sourceType = 1
                        self.showImagePicker.toggle()
                    }),
                    ActionSheet.Button.cancel()
                ])
            })
            if showImagePicker {
                ImagePicker(isVisible: $showImagePicker, image: $image, sourceType: sourceType)
            }
        }
        .onAppear { self.image = Image(self.friend.avatar)}
        .navigationBarTitle(Text(friend.name), displayMode: .inline)
        .background(
            Image(friend.poster)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 910, alignment: .center)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding([.leading, .trailing]))
    }
}

struct FriendDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetailsView(friend: Friend(name: "Kristina D.", mutualFriends: 350, avatar: "charleyrivers", poster: "lakemcdonald"))
    }
}
