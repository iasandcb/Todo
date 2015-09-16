//
//  TodoManager.swift
//  Todo
//
//  Created by Changshin Lee on 2015. 9. 15..
//  Copyright © 2015년 SKP. All rights reserved.
//

import Foundation

protocol TodoManager {

    static var sharedManager: TodoManager { get }
    
    func numberOfTodos() -> Int
    
}