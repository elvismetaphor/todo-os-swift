//
//  FinishedTableViewController.swift
//  ToDoList
//
//  Created by Peter Cheng on 26/4/2018.
//  Copyright © 2018 d. All rights reserved.
//

import UIKit

class FinishedTableViewController: UITableViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TodoList.shared.finishedItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListPrototypeCell", for: indexPath)

        // Configure the cell...
        let item = TodoList.shared.finishedItems[indexPath.row]
        cell.textLabel?.text = item.taskName

        return cell
    }

    // MARK: - Delegate

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            TodoList.shared.finishedItems.remove(at: indexPath.row)
            TodoList.shared.save()

            tableView.deleteRows(at: [indexPath], with: .right)
        }
    }
}
