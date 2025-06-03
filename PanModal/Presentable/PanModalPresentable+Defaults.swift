//
//  PanModalPresentable+Defaults.swift
//  PanModal
//
//  Copyright © 2018 Tiny Speck, Inc. All rights reserved.
//

#if os(iOS)
import UIKit

/**
 Default values for the PanModalPresentable.
 */
public extension PanModalPresentable where Self: UIViewController {
  
  var orientation: PanModalOrientation {
    PanModalOrientation.vertical
  }
  
  var horizontalOffset: CGFloat {
    return orientation == PanModalOrientation.horizontal 
      ? leadingLayoutOffset 
      : 0.0
  }
  
  var verticalOffset: CGFloat {
    topLayoutOffset + 21.0
  }
  
  var shortForm: PanModalHeight {
    longForm
  }
  
  var longForm: PanModalHeight {
    guard let scrollView = panScrollable else {
      return .maxHeight
    }
    // called once during presentation and stored
    scrollView.layoutIfNeeded()
    return .contentHeight(
      self.orientation == .vertical
      ? scrollView.contentSize.height
      : scrollView.contentSize.width
    )
  }
  
  var cornerRadius: CGFloat {
    8.0
  }
  
  var springDamping: CGFloat {
    0.8
  }
  
  var transitionDuration: Double {
    PanModalAnimator.Constants.defaultTransitionDuration
  }
  
  var transitionAnimationOptions: UIView.AnimationOptions {
    [.curveEaseInOut, .allowUserInteraction, .beginFromCurrentState]
  }
  
  var panModalBackgroundColor: UIColor {
    UIColor.black.withAlphaComponent(0.7)
  }
  
  var dragIndicatorBackgroundColor: UIColor {
    UIColor.lightGray
  }
  
  var scrollIndicatorInsets: UIEdgeInsets {
    let top: CGFloat = shouldRoundTopCorners ? cornerRadius : 0.0
    return UIEdgeInsets(top: top, left: 0, bottom: bottomLayoutOffset, right: 0)
  }
  
  var anchorModalToLongForm: Bool {
    true
  }
  
  var allowsExtendedPanScrolling: Bool {
    guard let scrollView = panScrollable else {
      return false
    }
    scrollView.layoutIfNeeded()
    return scrollView.contentSize.height > (scrollView.frame.height - bottomLayoutOffset)
  }
  
  var allowsDragToDismiss: Bool {
    true
  }
  
  var allowsTapToDismiss: Bool {
    true
  }
  
  var isUserInteractionEnabled: Bool {
    true
  }
  
  var isHapticFeedbackEnabled: Bool {
    true
  }
  
  var shouldRoundTopCorners: Bool {
    isPanModalPresented
  }
  
  var showDragIndicator: Bool {
    shouldRoundTopCorners
  }
  
  var shouldDismissWhenLongForm: Bool {
    false
  }
  
  var shouldUseAppearanceTransitions: Bool {
    false
  }
  
  func shouldRespond(to panModalGestureRecognizer: UIPanGestureRecognizer) -> Bool {
    true
  }
  
  func willRespond(to panModalGestureRecognizer: UIPanGestureRecognizer) {
    
  }
  
  func shouldTransition(to state: PanModalPresentationController.PresentationState) -> Bool {
    true
  }
  
  func shouldPrioritize(panModalGestureRecognizer: UIPanGestureRecognizer) -> Bool {
    false
  }
  
  func willTransition(to state: PanModalPresentationController.PresentationState) {
    
  }
  
  func panModalWillDismiss(fromGestureRecognizer: Bool) {
    
  }
  
  func panModalDidDismiss(fromGestureRecognizer: Bool) {
    
  }
}
#endif
