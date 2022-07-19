//
//  TableView+Helpers.swift
//  IbtikarTask
//
//  Created by Ahmed Ali on 27/11/2020.
//

import UIKit

// MARK: - UITableView + Helpers
//
extension UITableView {
    
    func registerCellNib<T: UITableViewCell>(_: T.Type, reuseIdentifier: String? = nil) {
        let nibName = reuseIdentifier ?? T.classNameWithoutNamespaces
        self.register(T.loadNib(), forCellReuseIdentifier: nibName)
    }
    
    /// Dequeue cell with generics
    func dequeue<T: UITableViewCell>(_: T.Type) -> T {
        guard
            let cell = dequeueReusableCell(withIdentifier: String(describing: T.self)) as? T
        else { fatalError("Could not dequeue cell with type \(T.self)") }
        
        return cell
    }
    
    /// Register UITableViewHeaderFooterView using a nib.
    func registerHeaderNib<T: UITableViewHeaderFooterView>(_: T.Type) {
        register(T.loadNib(), forHeaderFooterViewReuseIdentifier: T.classNameWithoutNamespaces)
    }
    
    /// Dequeue reusable `HeaderFooterView` with type.
    func dequeueHeaderFooter<T: UITableViewHeaderFooterView>() -> T {
        guard let header = dequeueReusableHeaderFooterView(withIdentifier: T.classNameWithoutNamespaces) as? T else {
            fatalError("Unable to get header view")
        }
        return header
    }
    
}
