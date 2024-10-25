//
//  DataFile.swift
//  ToDo
//
//  Created by 汤子晏 on 2024/10/6.
//

import Foundation

struct Todo: Identifiable {
    let id: UUID
    var name: String
    var startDate: Date
    var endDate: Date
    var description: String
    
    init(id: UUID = UUID(), name: String, startDate: Date, endDate: Date, description: String) {
        self.id = id
        self.name = name
        self.startDate = startDate
        self.endDate = endDate
        self.description = description
    }
    
}

class Schedule: Identifiable, ObservableObject {
    let id: UUID
    var name: String
    var isImportant: Bool
    @Published var todos: [Todo]
    init(id: UUID = UUID(), name: String, isImportant: Bool, todos: [Todo] = []) {
        self.id = id
        self.name = name
        self.isImportant = isImportant
        self.todos = todos
    }
    
    func toJson() -> String? {
        let scheduleDictionary = [
            "id": id.uuidString,
            "name": name,
            "isImportant": isImportant,
            "todos": todos.map { todo in
                return [
                    "id": todo.id.uuidString,
                    "name": todo.name,
                    "startDate": todo.startDate.description,
                    "endDate": todo.endDate.description,
                    "description": todo.description
                ]
            }
        ] as [String : Any]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: scheduleDictionary, options: []),
              let jsonString = String(data: jsonData, encoding: .utf8) else {
            return nil
        }
        
        return jsonString
    }
    
    class func fromJson(jsonString: String) -> Schedule? {
        guard let jsonData = jsonString.data(using: .utf8),
              let jsonObject = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any],
              let idString = jsonObject["id"] as? String,
              let id = UUID(uuidString: idString),
              let name = jsonObject["name"] as? String,
              let isImportant = jsonObject["isImportant"] as? Bool,
              let todosArray = jsonObject["todos"] as? [[String: Any]] else {
            return nil
        }
        
        let todos = todosArray.compactMap { todoDict -> Todo? in
            guard let idString = todoDict["id"] as? String,
                  let id = UUID(uuidString: idString),
                  let name = todoDict["name"] as? String,
                  let startDateString = todoDict["startDate"] as? String,
                  let endDateString = todoDict["endDate"] as? String,
                  let description = todoDict["description"] as? String,
                  let startDate = ISO8601DateFormatter().date(from: startDateString),
                  let endDate = ISO8601DateFormatter().date(from: endDateString) else {
                return nil
            }
            return Todo(id: id, name: name, startDate: startDate, endDate: endDate, description: description)
        }
        
        return Schedule(id: id, name: name, isImportant: isImportant, todos: todos)
    }
}
