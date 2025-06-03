//
//  PanModalOrientation.swift
//  PanModal
//
//  Created by Pedro Paulo de Amorim on 12/10/2021.
//  Copyright © 2021 Detail. All rights reserved.
//

#if os(iOS)
import UIKit

/**
 An enum that defines the possible orientation a pan modal container view
 for a given presentation state (vertical, horizontal)
 */
public enum PanModalOrientation: Equatable {
  case vertical
  case horizontal
}
#endif
