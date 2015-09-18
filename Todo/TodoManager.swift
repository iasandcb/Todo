//
//  TodoManager.swift
//  Todo
//
//  Created by Changshin Lee on 2015. 9. 11..
//  Copyright (c) 2015년 SKP. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class TodoManager {
    static let sharedManager = TodoManager()
    
    var todoList = [Todo]()
    
    func getList(handler: (Int) -> Void) {
        Alamofire.request(.GET, "http://lhd1413.sshel.com/list_memo.php")
            .responseJSON { (_, _, json) in
                let response = JSON(json.value!)
                for (_, subJson):(String, JSON) in response["result"] {
                    self.todoList.append(Todo(title: subJson["title"].stringValue, dueDate: NSDate()))
                }
                
                handler(response["count"].intValue)
        }
    }
    
    func numberOfTodos() -> Int {
        return todoList.count
    }
    
    func todoAt(index: Int) -> Todo {
        return todoList[index]
    }
    
    func addTodo(title: String, dueDate: NSDate, handler: (Bool) -> Void) {
        Alamofire.request(.GET, "http://lhd1413.sshel.com/add_memo.php", parameters: ["title" : title, "date" : dueDate])
            .responseJSON { (_, _, json) in
                let response = JSON(json.value!)
                print(response)
                handler(response["result"].stringValue == "success")
        }
    }
    
}

