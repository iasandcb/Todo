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

class CloudTodoManager {
    static let sharedManager = CloudTodoManager()
    
    var todoList = [Todo]()
    
    func numberOfTodos(handler : (Int) -> Void) {
        Alamofire.request(.GET, "http://lhd1413.sshel.com/list_memo.php")
            .responseJSON { (req, res, json) in
                print(json)
                var j = JSON(json.value!)
                print(j["count"])
                handler(j["count"].intValue)
        }
    }
    
    func todoAt(index : Int) -> Todo {
        return todoList[index]
    }
    
    func addTodo(title : String, dueDate : NSDate) {        
    }
    
}

