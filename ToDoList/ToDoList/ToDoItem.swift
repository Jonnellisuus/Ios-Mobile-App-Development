//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Jonne Kiukas on 9.2.2021.
//

import Foundation
import CoreData

public class ToDoItem:NSManagedObject, Identifiable {
    @NSManaged public var createdAt:Date?
    @NSManaged public var title:String?
}

extension ToDoItem {
    static func getAllToDoItems() -> NSFetchRequest<ToDoItem> {
        let request:NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest() as! NSFetchRequest<ToDoItem>
        
        let sortDescriptio = NSSortDescriptor(key: "createdAt", ascending: true)
        
        request.sortDescriptors = [sortDescriptio]
        
        return request
    }
}
