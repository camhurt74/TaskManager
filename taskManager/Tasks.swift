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
    //this function allows us to add tasks and asks when they should be done by setting a var as an int readline and it checks the input to make sure its not blank 
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
    //this function lets us remove tasks it sets an index to the items in the array
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
    //this function lets us mark tasks as complete, it sets an index to the items in the array and checks to see if the items if the index are not completed if they are it prints them out it also asks for which of the task that they would like to mark complete and checks to make sure the input is within the index.
    
    
    func completedTasks() {
        for index in 0..<toDoList.count {
            if toDoList[index].completed == false  {
                print("\(index). \(toDoList[index].taskTitle)")
            }
        }
        print("Please enter the index of the game you would like to mark complete:")
        var userInput = Int(readLine()!)
          let validTaskIndex = Array(0..<toDoList.count)
        while userInput == nil || !validTaskIndex.contains(userInput!) {
            print("Invalid input, please enter a valid index.")
            userInput = Int(readLine()!)
        }
        
        toDoList[userInput!].completed = true
        toDoList[userInput!].dueDate = nil
            print("Your task was completed.")
        
    }
    //this function lists completed tasks by taking the tasks out of the array that are completed and printing taskTitle (which is the users task).
    func listCompletedTasks()  {
        for task in toDoList {
            if task.completed == true {
                var taskTitle = task.taskTitle
                print("\(taskTitle) is completed.")
                
            }
        }
    }
    //this function lists the tasks that aren't completed by taking the task out of the array and checking if the task is completed if it's not it will print the task is due on due date.
    func listInCompletedTasks()  {
        for task in toDoList {
            if task.completed == false {
                if let dueDate = task.dueDate {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM/dd/yyyy"
                    print("\(task.taskTitle) is due on: \(dateFormatter.string(from: dueDate))")
                }
            }
        }
    }
    //this function allows us to mark tasks as incomplete, it sets an index to the items in the array and checks to see if the items if the index are completed if they are it prints them out it also asks for which of the task that they would like to mark incomplete and checks to make sure the input is within the index.
    func incompletedTasks() {
        for index in 1..<toDoList.count {
            if toDoList[index].completed == false {
                print("\(index). \(toDoList[index].taskTitle)")
            }
        }
        print("Please enter the index of the task you would like to mark incomplete:")
        var userInput = Int(readLine()!)
        let validTaskIndex = Array(0..<toDoList.count)
        while userInput == nil || !validTaskIndex.contains(userInput!) {
            print("Invalid input, please enter a valid index.")
            userInput = Int(readLine()!)
        }
    }
    
    
    
}

