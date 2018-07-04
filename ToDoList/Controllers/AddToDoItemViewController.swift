//
//  AddToDoItemViewController.swift
//  ToDoList
//
//  Created by Peter Cheng on 26/4/2018.
//  Copyright © 2018 d. All rights reserved.
//

import UIKit

class AddToDoItemViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        saveValidTask()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        textField.returnKeyType = UIReturnKeyType.done
        textField.delegate = self
        textField.becomeFirstResponder()
    }
    
    private func saveValidTask() {
        if let taskName = textField.text, !taskName.isEmpty {
            TodoList.shared.addTask(taskName)
            dismiss(animated: true, completion: nil)
        }
    }
}

extension AddToDoItemViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        saveValidTask()
    }
    
    func  textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
