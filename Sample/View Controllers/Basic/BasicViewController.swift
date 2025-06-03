//
//  BasicViewController.swift
//  PanModal
//
//  Created by Stephen Sowole on 2/26/19.
//  Copyright © 2019 PanModal. All rights reserved.
//

import UIKit

final class BasicViewController: UIViewController {

  // MARK: - UI Elements

  private let label: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.isOpaque = true
    label.text = "Text"
    label.textColor = .white
    label.textAlignment = .center
    return label
  }()

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupConstraints()
  }

  // MARK: - Setup Methods

  private func setupView() {
    view.isOpaque = false
    view.backgroundColor = .red
    view.addSubview(label)
  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([
      label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      label.topAnchor.constraint(equalTo: view.topAnchor),
      label.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }

  // MARK: - Status Bar

  override var preferredStatusBarStyle: UIStatusBarStyle {
    .lightContent
  }
}

// MARK: - PanModalPresentable

extension BasicViewController: PanModalPresentable {

  var orientation: PanModalOrientation { .vertical }

  var panScrollable: UIScrollView? { nil }

  var longForm: PanModalHeight { .maxHeightWithTopInset(200) }

  var anchorModalToLongForm: Bool { true }

  var horizontalOffset: CGFloat { 0.0 }

  var verticalOffset: CGFloat { 0.0 }
}
