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
        Friend(name: "Kristina D.", mutualFriends: 350, avatar: "charleyrivers", poster: "charleyrivers"),
        Friend(name: "David G.", mutualFriends: 1, avatar: "chilkoottrail", poster: "chilkoottrail"),
        Friend(name: "Robert B.", mutualFriends: 22, avatar: "chincoteague", poster: "chincoteague"),
        Friend(name: "Ruxi A.", mutualFriends: 10, avatar: "hiddenlake", poster: "hiddenlake"),
        Friend(name: "George B.", mutualFriends: 2, avatar: "icybay", poster: "icybay"),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(friends, id: \.id) { friend in
                    FirendRow(friend: friend).padding()
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

struct FirendRow: View {
    var friend: Friend
    var body: some View {
        HStack {
            Image(friend.avatar)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
                .clipShape(Circle())
                .frame(width: 80, height: 80)
            
            VStack(alignment: .leading, spacing: 10) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(friend.name)
                    Text("\(friend.mutualFriends) mutual friends")
                }
                HStack {
                    Button(action: {
                        print("Add friend")
                    }){
                        ZStack {
                            RoundedRectangle(cornerRadius: 2)
                                .frame(height: 35)
                                .foregroundColor(.blue)
                            Text("Add friend")
                                .font(.system(size: 13))
                                .foregroundColor(.white)
                        }
                    }
                    
                    Button(action: {
                        print("Remove")
                    }){
                        ZStack {
                            RoundedRectangle(cornerRadius: 2)
                                .frame(height: 35)
                                .foregroundColor(.gray)
                            Text("Remove")
                                .font(.system(size: 13))
                                .foregroundColor(.white)
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}
