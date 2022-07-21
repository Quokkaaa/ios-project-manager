//
//  TodoViewModel.swift
//  ProjectManager
//  Created by LIMGAUI on 2022/07/12

import Foundation
import Combine
import UIKit

final class TodoViewModel {
  typealias DataSource = UICollectionViewDiffableDataSource<Int, Todo>
  typealias SnapShot = NSDiffableDataSourceSnapshot<Int, Todo>
  
  private let storage: StorageType
  
  var todoDataSource: DataSource?
  var doingDataSource: DataSource?
  var doneDataSource: DataSource?
  
  init(storage: StorageType) {
    self.storage = storage
  }
  // MARK: - Input

  func deleActionDidTap(_ todo: Todo) {
    storage.delete(todo)
  }

  func popoverButtonDidTap(_ todo: Todo, to state: State) {
    let todo = Todo(
      id: todo.id,
      title: todo.title,
      content: todo.content,
      date: todo.date,
      state: state
    )
    
    storage.update(todo)
  }
  
  func applySnapShot(_ items: [Todo], dataSource: DataSource) {
    var snapshot = SnapShot()
    snapshot.appendSections([0])
    snapshot.appendItems(items)
    dataSource.apply(snapshot)
  }
  // MARK: - Output
  
  var toList: AnyPublisher<[Todo], Never> {
    return readData(by: .todo)
  }
  
  var doingList: AnyPublisher<[Todo], Never> {
    return readData(by: .doing)
  }
  
  var doneList: AnyPublisher<[Todo], Never> {
    return readData(by: .done)
  }
  
  private func readData(by state: State) -> AnyPublisher<[Todo], Never> {
    return storage.read().map { items in
      return items.filter { $0.state == state }
    }
    .eraseToAnyPublisher()
  }
}
