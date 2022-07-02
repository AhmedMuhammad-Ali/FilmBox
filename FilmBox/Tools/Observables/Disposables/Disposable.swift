//
//  Disposable.swift
//  DisposeBagDemo
//
//  Created by Ahmed Ali on 08/01/2021.
//

import Foundation

extension ObservationToken: Disposable {
  func dispose() {
    cancel()
  }
}

/// Represents a disposable resource.
public protocol Disposable {
  /// Dispose resource.
  func dispose()
}
