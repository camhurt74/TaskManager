//
//  Tasks.swift
//  taskManager
//
//  Created by Cameron Hurt on 9/17/18.
//  Copyright © 2018 Cameron Hurt. All rights reserved.
//

import Foundation

class Tasks {
    var toDoList : [TheTasks] = [TheTasks(taskTitle: "Do the laundry")]
    
    func addTasks() {
        print("Add your task that needs to be done.")
        var newTask = readLine()
        
        while newTask == nil || newTask == "" {
            print("Please input a task.")
        }
        let task = TheTasks(taskTitle: newTask!)
        
        toDoList.append(task)
        print("Your task was added.")
        listAllTasks()
    }
    func listAllTasks() {
        for task in toDoList {
            print(task.taskTitle)
    }
    
    }
    
    func removeTask() {
        for index in 1..<toDoList.count {
            print("\(index). \(toDoList[index].taskTitle)")
        }
        print("Please enter the number of the task you want to remove.")
        
        var userInput = Int(readLine()!)
        let validTaskIndex = Array(0..<toDoList.count)
        
        while userInput == nil || !validTaskIndex.contains(userInput!) {
            print("Invalid input, please enter a valid index.")
            userInput = Int(readLine()!)
        }
        
        toDoList.remove(at: userInput!)
        
        
    }
    
    func completedTasks() {
        for index in 1..<toDoList.count {
            if toDoList[index].completed == false {
                print("\(index). \(toDoList[index].taskTitle)")
            }
        }
        print("Please enter the index of the game you would like to mark complete:")
        var userInput = Int(readLine()!)
        while userInput == nil {
            print("Invalid input your input caused an error")
            userInput = Int(readLine()!)
            
        }
    
   
}
    func listCompletedTasks()  {
        for task in toDoList {
            if !task.completed {
                print(task.taskTitle)
                if let dueDate = task.dueDate {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM/dd/yyyy"
                    print("\(task.taskTitle) is due on:\(dateFormatter.string(from: dueDate))")
                }
            }
        }
    }
    func listUnCompletedTasks()  {
        for task in toDoList {
            if task.completed {
                print(task.taskTitle)
                if let dueDate = task.dueDate {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM/dd/yyyy"
                    print("\(task.taskTitle) is due on:\(dateFormatter.string(from: dueDate))")
                }
            }
        }
    }
    
    func incompletedTasks() {
        for index in 1..<toDoList.count {
            if toDoList[index].completed == true {
                print("\(index). \(toDoList[index].taskTitle)")
            }
        }
        print("Please enter the index of the game you would like to mark incomplete:")
        var userInput = Int(readLine()!)
        while userInput == nil {
            print("Invalid input your input caused an error")
            userInput = Int(readLine()!)
            
        }
        
        
    }

}
