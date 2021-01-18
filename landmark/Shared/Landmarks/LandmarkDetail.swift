//
//  LandmarkDetail.swift
//  landmark (iOS)
//
//  Created by Jonne Kiukas on 11.1.2021.
//

import Foundation
import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingAlert = false
    var landmark: Landmark
    
    var landmarkIndex: Int {
        guard let index = modelData.landmarks.firstIndex(where: {
            return $0.id == landmark.id
        }) else {
            return 0
        }
        return index
    }

    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)

            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            Button(action: {
            self.showingAlert = true
            }) {
            Image(systemName: "trash")
                .font(.largeTitle)
                .foregroundColor(Color.red)
            }
            
            .alert(isPresented: $showingAlert) {
            Alert(title: Text("Delete landmark"), message: Text("Are you sure you want to delete this landmark?"), primaryButton: .default(Text("Cancel")), secondaryButton: .destructive(Text("Delete")))
                }

            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                        .foregroundColor(.primary)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }

                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.automatic)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
    }
}
