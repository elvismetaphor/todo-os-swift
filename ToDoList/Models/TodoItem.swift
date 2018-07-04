//
//  TodoItem.swift
//  ToDoList
//
//  Created by d on 26/4/2018.
//  Copyright © 2018 d. All rights reserved.
//

import Foundation

class TodoItem: Codable {

    var taskName: String

    init(taskName: String) {
        self.taskName = taskName
    }
}
