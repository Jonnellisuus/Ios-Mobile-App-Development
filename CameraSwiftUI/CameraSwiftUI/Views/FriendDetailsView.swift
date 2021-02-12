//
//  FriendDetailsView.swift
//  CameraSwiftUI
//
//  Created by Jonne Kiukas on 12.2.2021.
//

import SwiftUI

struct FriendDetailsView: View {
    var friend: Friend
    
    var body: some View {
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
                    .frame(width: 120, height: 120)
                
                Text(friend.name)
                    .fontWeight(.bold)
            }.offset(y: -70)
            Spacer()
        }
        .navigationBarTitle(Text(friend.name), displayMode: .inline)
    }
}

struct FriendDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetailsView(friend: Friend(name: "Kristina D.", mutualFriends: 350, avatar: "charleyrivers", poster: "lakemcdonald"))
    }
}
