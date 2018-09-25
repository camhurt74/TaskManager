//
//  Tasks.swift
//  taskManager
//
//  Created by Cameron Hurt on 9/17/18.
//  Copyright © 2018 Cameron Hurt. All rights reserved.
//

import Foundation

class Tasks {
    var toDoList : [TheTasks] = []
    
    func addTasks() {
        print("Add your task that needs to be done.")
        var newTask = readLine()
        
        
         
        print("In how many days would you like this to be completed?")
        let userDueDate = Int(readLine()!)
       
        
        while newTask == nil || newTask == "" {
            print("Please input a task.")
        }
        while userDueDate == nil {
            print("No date added")
        }
        let currentCalender = Calendar.current
        var theDueDate = currentCalender.date(byAdding: .day, value: userDueDate!, to: Date())
       
        
        let myTask = TheTasks(taskTitle: newTask!)
        
        myTask.dueDate = theDueDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        print("The task was added and should be done by: \(dateFormatter.string(from: theDueDate!))")
        
        toDoList.append(myTask)
        listAllTasks()
        
    }
    
    func listAllTasks() {
        for task in toDoList {
            print(task.taskTitle)
        }
        
    }
    
    func removeTask() {
        for index in 0..<toDoList.count {
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
        for index in 0..<toDoList.count {
            if toDoList[index].completed == false  {
                print("\(index). \(toDoList[index].taskTitle)")
            }
        }
        print("Please enter the index of the game you would like to mark complete:")
        var userInput = Int(readLine()!)
        while userInput == nil {
            print("Invalid input your input caused an error")
            userInput = Int(readLine()!)
            
        }
        toDoList[userInput!].completed = true
        toDoList[userInput!].dueDate = nil
            print("Your task was completed.")
        
    }
    func listCompletedTasks()  {
        for task in toDoList {
            if task.completed == true {
                var taskTitle = task.taskTitle
                print("\(taskTitle) is completed.")
                
            }
        }
    }
    func listUnCompletedTasks()  {
        for task in toDoList {
            if task.completed == false {
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
            if toDoList[index].completed == false {
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
