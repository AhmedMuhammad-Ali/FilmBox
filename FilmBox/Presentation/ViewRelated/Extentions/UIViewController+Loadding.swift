//
//  UIViewController+Loadding.swift
//  FilmBox
//
//  Created by Ahmed Ali on 28/11/2020.
//

import UIKit

// MARK: - Loading
//
extension BaseViewController {

    func shouldShowProgressView(_ show: Bool) {
        DispatchQueue.main.async {
            show ? self.showActivityIndicator() : self.hideActivityIndicator()
        }
    }
    /// Show activity Indicator
    func showActivityIndicator() {
        
        activityView.color = .white
        activityView.center = self.view.center
        self.view.addSubview(activityView)
        activityView.startAnimating()

    }
    /// Hide activity indicator
    func hideActivityIndicator() {
        activityView.stopAnimating()
    }
}
