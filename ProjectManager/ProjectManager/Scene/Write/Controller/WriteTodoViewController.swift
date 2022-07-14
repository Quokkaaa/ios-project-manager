//
//  WriteViewController.swift
//  ProjectManager
//
//  Created by LIMGAUI on 2022/07/10

import UIKit

class WriteTodoViewController: UIViewController {
  weak var todoDelegate: TodoDelegate?
  lazy var writeView = WriteTodoView(frame: view.frame)
  
  override func loadView() {
    super.loadView()
    view = writeView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setTitle()
  }
  
  func setTitle() {
    navigationItem.title = "TODO"
    navigationController?.navigationBar.barTintColor = UIColor.systemGray
    navigationItem.leftBarButtonItem = UIBarButtonItem(
      systemItem: .cancel, primaryAction: UIAction(handler: { _ in
        self.dismiss(animated: true)
      }))

    navigationItem.rightBarButtonItem = UIBarButtonItem(
      systemItem: .done,
      primaryAction: UIAction(handler: { [weak self] _ in
        guard let writedTodoData = self?.writeView.createTodoData(state: .todo) else { return }
        
        let realmTodo = TodoManager.shared.mappingTodoModel(from: writedTodoData)
        TodoManager.shared.create(realmTodo)
        
        self?.todoDelegate?.createData(writedTodoData)
        self?.dismiss(animated: true)
      }))
  }
}
