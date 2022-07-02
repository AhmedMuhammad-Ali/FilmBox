//
//  UIViewController+Alerts.swift
//  IbtikarTask
//
//  Created by Ahmed Ali on 28/11/2020.
//

import UIKit

// MARK: - Alert
//
extension UIViewController {
    
    typealias AlertHandler = ((UIAlertAction) -> Void)
    
    func showAlert(title: String? = nil,
                   message: String? = nil,
                   actions: UIAlertAction?...,
                   completion: (() -> Void)? = nil) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions
            .compactMap { $0 }
            .forEach { alertVC.addAction($0) }
        DispatchQueue.main.async {
            self.present(alertVC, animated: true, completion: completion)
        }
    }
    
    /// Show error Alert
    func showErrorAlert(error: String, handler: UIAlertAction? = nil) {
        let okAction = UIAlertAction(title: "OK", style: .default)
        showAlert(title: nil, message: error, actions: okAction, handler)
    }
}
