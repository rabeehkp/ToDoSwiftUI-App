//
//  ToDoItemView.swift
//  TodoApp
//
//  Created by rabeeh on 14/11/19.
//  Copyright © 2019 NFNLabs. All rights reserved.
//

import SwiftUI

struct ToDoItemView: View {
    var title :String = ""
    var createdAt :String = ""
    var todo:String = ""
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(title)
                    .font(.headline)
                Text(todo)
                    .font(.body)
                Text(createdAt)
                    .font(.caption)
            }
        }
    }
}

struct ToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemView(title: "my first", createdAt: "Today", todo: "bjhsbjbkjs bjsbdkbkj bjbjksbf kbsjkfdb bjukbjkf jhbjkbfd jkbajkfbk jbkjdfb  kjbjkfsb jkbjkbf jkbbfkj bjkbf")
    }
}
