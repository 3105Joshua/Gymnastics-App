//
//  Task.swift
//  Gymnastics Health App
//
//  Created by Joshua Liu on 9/11/24.
//

import SwiftUI

struct Task: Identifiable {
    var id: UUID = .init()
    var taskTitle: String
    var creationDate: Date = .init()
    var isCompleted: Bool = false
    var tint: Color
}

var sampleTasks: [Task] = [
    .init(taskTitle: "Record Video", creationDate: .updateHour(-5), isCompleted: true, tint: .blue),
    .init(taskTitle: "Redesign Website", creationDate: .updateHour(-3), tint: .green)
]
    
extension Date {
    static func updateHour(_ value: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .hour, value: value, to: .init()) ?? .init()
    }
}
