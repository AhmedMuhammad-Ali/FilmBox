//
//  DisposeBag.swift
//  DisposeBagDemo
//
//  Created by Ahmed Ali on 08/01/2021.
//

import Foundation

extension Disposable {
  /// Adds `self` to `bag`
  ///
  /// - parameter bag: `DisposeBag` to add `self` to.
  public func disposed(by bag: DisposeBag) {
    bag.insert(self)
  }
}

/**
 Thread safe bag that disposes added disposables on `deinit`.
 This returns ARC (RAII) like resource management to `RxSwift`.
 In case contained disposables need to be disposed, just put a different dispose bag
 or create a new one in its place.
 self.existingDisposeBag = DisposeBag()
 In case explicit disposal is necessary, there is also `CompositeDisposable`.
 */
public final class DisposeBag: DisposeBase {
  
  // state
  private var disposables = [Disposable]()
  
  /// Constructs new empty dispose bag.
  public override init() {
    super.init()
  }
  
  /// Adds `disposable` to be disposed when dispose bag is being deinited.
  ///
  /// - parameter disposable: Disposable to add.
  public func insert(_ disposable: Disposable) {
    self.disposables.append(disposable)
  }
  
  /// This is internal on purpose, take a look at `CompositeDisposable` instead.
  private func dispose() {
    self.disposables.removeAll(keepingCapacity: false)
  }
  
  deinit {
    self.dispose()
    print(#function, "Dispose Bag")
  }
}

extension DisposeBag {
  /// Convenience init allows a list of disposables to be gathered for disposal.
  public convenience init(disposing disposables: Disposable...) {
    self.init()
    self.disposables += disposables
  }
  
  /// Convenience init which utilizes a function builder to let you pass in a list of
  /// disposables to make a DisposeBag of.
  public convenience init(@DisposableBuilder builder: () -> [Disposable]) {
    self.init(disposing: builder())
  }
  
  /// Convenience init allows an array of disposables to be gathered for disposal.
  public convenience init(disposing disposables: [Disposable]) {
    self.init()
    self.disposables += disposables
  }
  
  /// Convenience function allows a list of disposables to be gathered for disposal.
  public func insert(_ disposables: Disposable...) {
    self.insert(disposables)
  }
  
  /// Convenience function allows a list of disposables to be gathered for disposal.
  public func insert(@DisposableBuilder builder: () -> [Disposable]) {
    self.insert(builder())
  }
  
  /// Convenience function allows an array of disposables to be gathered for disposal.
  public func insert(_ disposables: [Disposable]) {
    self.disposables += disposables
  }
  
  /// A function builder accepting a list of Disposables and returning them as an array.
  @resultBuilder
  public struct DisposableBuilder {
    public static func buildBlock(_ disposables: Disposable...) -> [Disposable] {
      return disposables
    }
  }
}
