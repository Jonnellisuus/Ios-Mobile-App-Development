//
//  FrendsView.swift
//  CameraSwiftUI
//
//  Created by Jonne Kiukas on 12.2.2021.
//

import SwiftUI

struct Friend: Identifiable {
    var id: UUID = UUID()
    var name: String
    var mutualFriends: Int
    var avatar: String
    var poster: String
}

struct FrendsView: View {
    var friends:[Friend] = [
        Friend(name: "Kristina D.", mutualFriends: 350, avatar: "charleyrivers", poster: "lakemcdonald"),
        Friend(name: "David G.", mutualFriends: 1, avatar: "chilkoottrail", poster: "rainbowlake"),
        Friend(name: "Robert B.", mutualFriends: 22, avatar: "chincoteague", poster: "twinlake"),
        Friend(name: "Ruxi A.", mutualFriends: 10, avatar: "hiddenlake", poster: "silversalmoncreek"),
        Friend(name: "George B.", mutualFriends: 2, avatar: "icybay", poster: "stmarylake"),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(friends, id: \.id) { friend in
                    FriendRow(friend: friend).padding()
                }
                .navigationBarTitle("Friends")
            }
        }
    }
}

struct FrendsView_Previews: PreviewProvider {
    static var previews: some View {
        FrendsView()
    }
}
