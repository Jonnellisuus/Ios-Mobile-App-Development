//
//  ContentView.swift
//  ToDoList
//
//  Created by Jonne Kiukas on 9.2.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: ToDoItem.getAllToDoItems()) var toDoItems:FetchedResults<ToDoItem>
    @State private var newToDoItem = ""
    
    var body: some View {
        Text("Hello world")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// .environment()\.managedObjectContext, PersistenceController.preview.container.viewContext
