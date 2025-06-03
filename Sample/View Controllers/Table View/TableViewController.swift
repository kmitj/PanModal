//
//  TableViewController.swift
//  PanModalDemo
//
//  Created by Pedro Paulo de Amorim on 24/09/2021.
//  Copyright © 2021 Detail. All rights reserved.
//

import Foundation
import UIKit

final class TableViewController: UITableViewController {

  private let members = (0..<100).map { "Item \($0)" }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
  }

  // MARK: - View Configurations

  func setupTableView() {
    tableView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    tableView.separatorStyle = .none
    tableView.backgroundColor = #colorLiteral(red: 0.1019607843, green: 0.1137254902, blue: 0.1294117647, alpha: 1)
    tableView.cellLayoutMarginsFollowReadableWidth = false
  #if swift(>=5.5)
    if #available(iOS 15.0, *) {
      tableView.sectionHeaderTopPadding = 0.0
    }
  #endif
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    members.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = members[indexPath.row]
    return cell
  }

  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    60.0
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    dismiss(animated: true)
  }

}

extension TableViewController: PanModalPresentable {

  var panScrollable: UIScrollView? {
    tableView
  }

  var shortForm: PanModalHeight {
    PanModalHeight.maxHeight
  }

  var shouldDismissWhenLongForm: Bool {
    true
  }

  var shouldUseAppearanceTransitions: Bool {
    true
  }

  func panModalDidDismiss(fromGestureRecognizer: Bool) {
    print("panModalDidDismiss from gesture recognizer: \(fromGestureRecognizer)")
  }

  func panModalWillDismiss(fromGestureRecognizer: Bool) {
    print("panModalWillDismiss from gesture recognizer: \(fromGestureRecognizer)")
  }

}
