//
//  actualTasks.swift
//  taskManager
//
//  Created by Cameron Hurt on 9/17/18.
//  Copyright © 2018 Cameron Hurt. All rights reserved.
//

import Foundation

class TheTasks {
    let taskTitle: String
    var completed: Bool = false
    var dueDate: Date?
    
    init(taskTitle: String) {
        self.taskTitle = taskTitle
    }
    
}
