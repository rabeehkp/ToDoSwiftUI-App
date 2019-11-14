//
//  ContentView.swift
//  TodoApp
//
//  Created by rabeeh on 14/11/19.
//  Copyright © 2019 NFNLabs. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: ToDoItem.getAllToDoItem()) var toDoItems:FetchedResults<ToDoItem>
    
    @State private var newToDoTitle = ""
    @State private var newToDoDescription = ""
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Whats next?")){
                    VStack{
                        HStack(){
                            TextField("new item", text: self.$newToDoTitle)
                            Button(action: {
                                let toDoItem = ToDoItem(context: self.managedObjectContext)
                                toDoItem.title = self.newToDoTitle
                                toDoItem.todo = self.newToDoDescription
                                toDoItem.createdAt = Date()
                                
                                do{
                                    try self.managedObjectContext.save()
                                }catch{
                                    print(error)
                                }
                                
                                self.newToDoTitle = ""
                                self.newToDoDescription = ""
                            }){
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.green)
                                    .imageScale(.large)
                            }
                            
                        }
                        HStack{
                            TextField("description", text: self.$newToDoDescription)
                        }
                    }
                }.font(.headline)
                Section(header: Text("To Do's")){
                    ForEach(self.toDoItems){toDoItem in
                        
                        ToDoItemView(title: toDoItem.title!, createdAt: "\(toDoItem.createdAt!)", todo: toDoItem.todo!)
                    }.onDelete{ indexSet in
                        let deleteItem = self.toDoItems[indexSet.first!]
                        self.managedObjectContext.delete(deleteItem)
                        
                        do{
                            try self.managedObjectContext.save()
                        }catch{
                            print(error)
                        }
                        
                    }
//                    Text("T0 Do's")
                }
            }
            .navigationBarTitle(Text("My List"))
            .navigationBarItems(trailing: EditButton())
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
