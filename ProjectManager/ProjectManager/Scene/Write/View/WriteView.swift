//
//  WriteView.swift
//  ProjectManager
//
//  Created by LIMGAUI on 2022/07/11.
//

import UIKit

final class WriteView: UIView {
  private let mainStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.backgroundColor = .systemBackground
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  private let titleTextField: UITextField = {
    let textfield = UITextField()
    textfield.placeholder = "Title"
    textfield.textAlignment = .left
    textfield.font = .preferredFont(forTextStyle: .title1)
    textfield.layer.shadowOpacity = 0.5
    textfield.borderStyle = .line
    textfield.backgroundColor = .systemBackground
    return textfield
  }()
  
  private let datePicker: UIDatePicker = {
    let datePicker = UIDatePicker()
    datePicker.locale = Locale(identifier: "en_US")
    datePicker.datePickerMode = .date
    datePicker.preferredDatePickerStyle = .wheels
    datePicker.backgroundColor = UIColor.white
    datePicker.backgroundColor = .systemBackground
    return datePicker
  }()
  
  private let contentTextView: UITextView = {
    let textView = UITextView()
    textView.font = .preferredFont(forTextStyle: .title1)
    textView.layer.shadowOpacity = 0.5
    textView.backgroundColor = .systemBackground
    textView.layer.shadowOpacity = 0.5
    textView.layer.borderWidth = 1
    textView.layer.borderColor = UIColor.black.cgColor
    return textView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureUI() {
    setContraints()
    backgroundColor = .systemBackground
    layer.cornerRadius = 20
  }
  
  private func setContraints() {
    addSubview(mainStackView)
    mainStackView.addArrangedSubviews([titleTextField, datePicker, contentTextView])
    NSLayoutConstraint.activate([
      mainStackView.widthAnchor.constraint(equalToConstant: bounds.width),
      mainStackView.heightAnchor.constraint(equalToConstant: bounds.height * 0.72),
      mainStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
  }
  
  func createTodoData(state: State) -> Todo {
    guard let title = titleTextField.text,
          let content = contentTextView.text else { return Todo() }
    let date = datePicker.date
    
    let todo = Todo(title: title, content: content, date: date, state: state)
    
    return todo
  }
  
  func setUserInteractionEnableViews(_ bool: Bool) {
    titleTextField.isUserInteractionEnabled = bool
    datePicker.isUserInteractionEnabled = bool
    contentTextView.isUserInteractionEnabled = bool
  }
  
  func updateTodoData(_ todo: Todo) {
    titleTextField.text = todo.title
    datePicker.date = todo.date
    contentTextView.text = todo.content
  }
}
