//
//  ToDo.swift
//  ProjectManager
//
//  Created by LIMGAUI on 2022/07/07.

import Foundation
import RealmSwift

struct Todo: Hashable {
  var title: String = ""
  var content: String = ""
  var date: Date = Date.now
  var state: State = .done
  var identifier: String = UUID().uuidString
  
  var readList = [Todo]()
  
  mutating func mappingTodo(from todoModels: [TodoModel]) {
    let todoList = todoModels.map { todoModel -> Todo in
      guard let state = State(rawValue: todoModel.state) else {
        return Todo()
      }
      
      return Todo(
        title: todoModel.title,
        content: todoModel.content,
        date: todoModel.date,
        state: state,
        identifier: todoModel.identifier)
    }
    
    readList = todoList
  }
}
