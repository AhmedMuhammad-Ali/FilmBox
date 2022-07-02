//
//  BaseViewController.swift
//  FilmBox
//
//  Created by Ahmed Ali on 28/11/2020.
//

import UIKit

// MARK: - Base View Controller
//
class BaseViewController: UIViewController {
    
    // MARK: - Properties
    let activityView = UIActivityIndicatorView(style: .large)
        
    // MARK: - ViewModel + State Binding Helpers

    @discardableResult
    func bindLoadingState(to viewModel: BaseViewModel) -> ObservationToken {
        return viewModel.state.subscribe { [weak self] state in
            self?.shouldShowProgressView(state == .loading)
        }
    }
    
    @discardableResult
    func bindErrorState(to viewModel: BaseViewModel) -> ObservationToken {
        return viewModel.state.subscribe { [weak self] state in
            if case .failure(let error) = state {
                self?.showErrorAlert(error: error)
            }
        }
    }

}
