//
//  LandmarkList.swift
//  landmark (iOS)
//
//  Created by Jonne Kiukas on 11.1.2021.
//

import Foundation
import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
                .onDelete(perform: deleteLandmark)
                .onMove(perform: moveLandmark)
            }
            .navigationTitle("Landmarks")
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func deleteLandmark(at offsets: IndexSet) {
        modelData.landmarks.remove(atOffsets: offsets)
    }
    func moveLandmark(from source: IndexSet, to destination: Int) {
        modelData.landmarks.move(fromOffsets: source, toOffset: destination)
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkList()
                .environmentObject(ModelData())
            LandmarkList()
                .environmentObject(ModelData())
                .environment(\.colorScheme, .dark)
            LandmarkList()
                .environmentObject(ModelData())
                .environment(\.sizeCategory, .extraExtraExtraLarge)
        }
    }
}
