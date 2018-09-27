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
       3 List incompleted tasks
       4 List completed tasks
       5 Mark a task complete
       6 Mark task as incomplete
       7 delete a task
       8 quit

please enter a number between 1-8

""")
    }
    func handleInput(_ input: String) {  // This function handles the user input and checks to see if it is 1-8 if not the code will break.
        switch input {
        case "1":
          taskManager.addTasks()
        case "2":
            taskManager.listAllTasks()
        case "3":
            taskManager.listInCompletedTasks()
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
        
        func validateInput(_ input: String) -> Bool { //This function sees if input can be interpretated by taking an input paramater and setting an array that contains the numbers 1-8 to a constant and uses a gaurd statement to change the input from earlier from a string to an Int.
            let validMenuOptions = Array(1...8)
            guard let number = Int(input) else {
                return false
            }
            return validMenuOptions.contains(number)
            
        }
        
        
        var shouldQuit = false
        func quit() {
            
            shouldQuit = true
            print("Thanks for Using the Application")
        }
        func getInput() -> String { //This function gets the users input by taking readline, and if the input is blank it will ask the user to enter a valid input.
            var userInput = readLine()
            while userInput == nil || userInput == "" {
                print("Please give a valid input")
                userInput = readLine()
            }
            return userInput!
        }
        func go() { //this function states that if the user does not want to quit the menu will print out and then it gets the input again it also asks if the user would like to return to the menu or not.
            
            while !shouldQuit{
                printMenu()
                var input = getInput()
                while validateInput(input) == false {
                    printMenu()
                    
                    input = getInput()
                }
                handleInput(input)
                if !shouldQuit {
                print("Would you like to go back to the menu?")
                var userInput = readLine()
                if userInput == "Y" {
                    printMenu()
                }; if userInput == "N"  {
                   quit()
                }
                }
                
              
            }
        }
    
}
