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
    @State var showActionSheet = false
    
    var body: some View {
        ZStack {
            VStack {
                Image(friend.poster)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200, alignment: .center)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding([.leading, .trailing])
                
                VStack {
                    Image(friend.avatar)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                        .clipShape(Circle())
                        .frame(width: 160, height: 160)
                        .overlay(
                            CameraButtonView(showActionSheet: $showActionSheet)
                                .offset(x: 50, y: 65)
                        )
                    
                    Text(friend.name)
                        .fontWeight(.bold)
                }.offset(y: -70)
                Spacer()
            }
            .actionSheet(isPresented: $showActionSheet, content: { () -> ActionSheet in ActionSheet(title: Text("Select Image"), message: Text("Please select an image from the image gallery or use the camera"), buttons: [ActionSheet.Button.default(Text("Camera"), action: {
                    }),
                    ActionSheet.Button.default(Text("Photo Gallery"), action: {
                        self.showImagePicker.toggle()
                    }),
                    ActionSheet.Button.cancel()
                ])
            })
            if showImagePicker {
                ImagePicker()
            }
        }.navigationBarTitle(Text(friend.name), displayMode: .inline)
    }
}

struct FriendDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetailsView(friend: Friend(name: "Kristina D.", mutualFriends: 350, avatar: "charleyrivers", poster: "lakemcdonald"))
    }
}
