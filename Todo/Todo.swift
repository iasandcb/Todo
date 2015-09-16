//
//  Todo.swift
//  Todo
//
//  Created by Changshin Lee on 2015. 9. 11..
//  Copyright (c) 2015년 SKP. All rights reserved.
//

import Foundation
import RealmSwift

class Todo: Object {
    dynamic var title : String = "No title"
    dynamic var dueDate : NSDate = NSDate()
}