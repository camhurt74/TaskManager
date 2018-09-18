//
//  Menu.swift
//  taskManager
//
//  Created by Cameron Hurt on 9/17/18.
//  Copyright © 2018 Cameron Hurt. All rights reserved.
//

import Foundation

class Menu {
    let taskManager = Tasks()
    func printMenu() {
        print("""
       Task Manager
       1 Create new task
       2 list all tasks
       3 List uncompleted tasks
       4 List completed tasks
       5 Mark a task complete
       6 Mark task as incomplete
       7 delete a task
       8 quit

please enter a number between 1-8

""")
    }
    func handleInput(_ input: String) {  //This function was taken directly from the video game library it excecutes the same function.
        switch input {
        case "1":
          taskManager.addTasks()
        case "2":
            taskManager.listAllTasks()
        case "3":
          taskManager.listUnCompletedTasks()
        case "4":
          taskManager.listCompletedTasks()
            
        case "5":
            taskManager.completedTasks()
        case "6":
            taskManager.incompletedTasks()
        case "7":
            taskManager.removeTask()
        case "8":
            quit()
            
        default:
            break
            
        }
    }
        
        func validateInput(_ input: String) -> Bool { //This function sees if input can be interpretated.
            let validMenuOptions = Array(1...8)
            guard let number = Int(input) else {
                return false
            }
            return validMenuOptions.contains(number)
            
        }
        
        
        var shouldQuit = false
        func quit() { //This function allows us to quit the task manager.
            
            shouldQuit = true
            print("Thanks for Using the Application")
        }
        func getInput() -> String {
            var userInput = readLine()
            while userInput == nil || userInput == "" {
                print("Please give a valid input")
                userInput = readLine()
            }
            return userInput!
        }
        func go() { //This function allows us to make the task manager run.
            
            while !shouldQuit{
                printMenu()
                var input = getInput()
                while validateInput(input) == false {
                    printMenu()
                    
                    input = getInput()
                }
                handleInput(input)
                print("Would you like to go back to the menu?") //This gives users the option to return to the menu or quit.
                readLine()
                if readLine() == "Y" {
                    printMenu()
                }; if readLine() == "N"  {
                    quit()
                }
                
                
            }
        }
    
}
