//
//  TodoList.swift
//  ToDoList
//
//  Created by d on 26/4/2018.
//  Copyright © 2018 d. All rights reserved.
//

import Foundation

class TodoList {
    var items: [TodoItem]
    var finishedItems: [TodoItem]

    static let shared = TodoList()

    private init() {
        if let data = UserDefaults.standard.data(forKey: "active"),
            let items = try? PropertyListDecoder().decode([TodoItem].self, from: data) {
            self.items = items
        } else {
            self.items = [TodoItem]()
        }

        if let data = UserDefaults.standard.data(forKey: "finished"),
            let finishedItems = try? PropertyListDecoder().decode([TodoItem].self, from: data) {
            self.finishedItems = finishedItems
        } else {
            self.finishedItems = [TodoItem]()
        }
    }

    @discardableResult func addTask(_ task: String) -> TodoItem {
        let newItem = TodoItem(taskName: task)
        items.append(newItem)
        save()
        return newItem
    }

    func save() {
        if let data = try? PropertyListEncoder().encode(items) {
            UserDefaults.standard.set(data, forKey: "active")
        }

        if let data = try? PropertyListEncoder().encode(finishedItems) {
            UserDefaults.standard.set(data, forKey: "finished")
        }

        UserDefaults.standard.synchronize()
    }
}
