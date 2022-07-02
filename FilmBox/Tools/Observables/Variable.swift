import Foundation
///
/// **This concept will be deprecated from RxSwift but offical migration path hasn't been decided yet.**
/// https://github.com/ReactiveX/RxSwift/issues/1501
///
/// Current recommended replacement for this API is `RxCocoa.BehaviorRelay` because:
/// * `Variable` isn't a standard cross platform concept, hence it's out of place in RxSwift target.
/// * It doesn't have a counterpart for handling events (`PublishRelay`). It models state only.
/// * It doesn't have a consistent naming with *Relay or other Rx concepts.
/// * It has an inconsistent memory management model compared to other parts of RxSwift (completes on `deinit`).
///
/// Once plans are finalized, official availability attribute will be added in one of upcoming versions.
final class Variable<Element>: Observable<Element> {
  
  private var _value: Element
  /// Gets or sets current value of variable.
  ///
  /// Whenever a new value is set, all the observers are notified of the change.
  ///
  /// Even if the newly set value is same as the old value, observers are still notified for change.
  public private(set) var value: Element {
    get {
      return self._value
    }
    set {
      self._value = newValue
      notifyObservers(newValue)
    }
  }
  
  /// Initializes variable with initial value.
  ///
  /// - parameter value: Initial variable value.
  public init(_ value: Element) {
    self._value = value
  }
  
  private typealias OnCancel = () -> Void
  
  /// The list of Observers that will be notified when a new value is sent.
  ///
  private var observers = [UUID: Observer<Element>]()
  
  override func subscribe(_ onNext: @escaping OnNext<Element>) -> ObservationToken {
    let uuid = UUID()
    
    observers[uuid] = Observer(onNext: onNext)
    
    let onCancel: OnCancel = { [weak self] in
      self?.observers.removeValue(forKey: uuid)
    }
    
    return ObservationToken(onCancel: onCancel)
  }
  
  /// Emit a new value. All observers are immediately called with the given value.
  ///
  func send(_ element: Element) {
    self.value = element
  }
  
  private func notifyObservers(_ value: Element) {
    observers.values.forEach { observer in
      observer.send(value)
    }
  }
  
}
