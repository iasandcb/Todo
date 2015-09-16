//
//  TodoManager.swift
//  Todo
//
//  Created by Changshin Lee on 2015. 9. 11..
//  Copyright (c) 2015년 SKP. All rights reserved.
//

import Foundation
import RealmSwift

class RealmTodoManager : TodoManager {
    static let sharedManager = RealmTodoManager()
    
    var todoList = [Todo]()
    
    func numberOfTodos() -> Int {
        return 0
    }
    
    func todoAt(index : Int) -> Todo {
        return todoList[index]
    }
    
    func addTodo(title : String, dueDate : NSDate) {
        do {
            let realm = try Realm()
            let todo = Todo()
            todo.title = title
            todo.dueDate = dueDate
            try realm.write {
                realm.add(todo)
            }
            
        } catch {
            
        }
        
    }
    
}

