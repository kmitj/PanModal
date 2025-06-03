//
//  DragIndicatorView.swift
//  PanModal
//
//  Copyright © 2025 Pedro Paulo de Amorim, Inc. All rights reserved.
//

#if os(iOS)
import UIKit

/**
 A view wrapper around the presented view in a PanModal transition.

 This allows us to make modifications to the presented view without
 having to do those changes directly on the view
 */
class DragIndicatorView: UIView {

  override init(frame: CGRect) {
    super.init(frame: frame)
    if #available(iOS 13.0, *) {
      self.layer.cornerCurve = .continuous
    }
  }

  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

extension UIView {

  /**
   Convenience property for retrieving a PanContainerView instance
   from the view hierachy
   */
  var dragIndicatorView: DragIndicatorView? {
    return subviews.first(where: { view -> Bool in
      view is DragIndicatorView
    }) as? DragIndicatorView
  }

}
#endif
