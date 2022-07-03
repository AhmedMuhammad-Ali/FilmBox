//
//  HomeViewModel.swift
//  FilmBox
//
//  Created by Ahmed Ali on 02/07/2022.
//

import Foundation
// MARK: - HomeViewModel
//
class HomeViewModel: BaseViewModel {
    
    // MARK: - Properties
    
    let interactor: EpisodeRepository
    
//    /// HomeDataSource
//    var dataSource: HomeDataSource = {
//        return HomeDataSource()
//    }()
    
    /// Called when data is updated and reload is needed.
    ///
    private var setReloadNeeded: (() -> Void)?
    // MARK: - Init
    
    init(interactor: EpisodeRepository = DefaultEpisodeRepository()) {
        self.interactor = interactor
    }
    
    // MARK: - Lifecycle
    
    func viewDidLoad() {
        
        let dispatchGroup  = DispatchGroup()
        
        self.state.send(.loading)
        
        dispatchGroup.enter()
        getEpisods {
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            self.state.send(.success(Int.zero))
            self.setReloadNeeded?()
        }
    }
}
// MARK: - Helpers
//
extension HomeViewModel {
    
    func configureOnReload(onReload: @escaping (() -> Void)) {
        self.setReloadNeeded = onReload
    }
}
// MARK: - Load Data

private extension HomeViewModel {

    /// Get episods
    func getEpisods(_ completion: @escaping () -> Void) {
        interactor.getEpisodes { [weak self] (result) in
            switch result {
            case .success(let episodes):
                print("success episodes \(episodes)")
                completion()
            case .failure(let errorMessage):
                self?.state.send(.failure("\(errorMessage)"))
                completion()
            }
        }
    }
    
}
