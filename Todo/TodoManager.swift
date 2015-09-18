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
    
    func numberOfTodos(handler : (Int) -> Void) {
        Alamofire.request(.GET, "http://lhd1413.sshel.com/list_memo.php")
            .responseJSON { (_, _, json) in
                var response = JSON(json.value!)
                for (_, subJson):(String, JSON) in response["result"] {
//                    todoList +=
                }
                
                handler(response["count"].intValue)
        }
    }
    
    func todoAt(index : Int) -> Todo {
        return todoList[index]
    }
    
    func addTodo(title : String, dueDate : NSDate) {
    }
    
}

