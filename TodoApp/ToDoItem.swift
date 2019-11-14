//
//  ToDoItem.swift
//  TodoApp
//
//  Created by rabeeh on 14/11/19.
//  Copyright © 2019 NFNLabs. All rights reserved.
//

import Foundation
import CoreData

public class ToDoItem:NSManagedObject,Identifiable{
    @NSManaged public var createdAt:Date?
    @NSManaged public var title:String?
    @NSManaged public var todo:String?
}

extension ToDoItem{
    static func getAllToDoItem()-> NSFetchRequest<ToDoItem>{
        let request : NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest() as! NSFetchRequest<ToDoItem>
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
