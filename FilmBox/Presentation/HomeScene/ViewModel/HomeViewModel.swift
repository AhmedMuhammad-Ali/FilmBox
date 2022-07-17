//
//  HomeViewModel.swift
//  FilmBox
//
//  Created by Ahmed Ali on 02/07/2022.
//

import Foundation

// MARK: - Input Protocol
//
protocol HomeViewModelInput {
    func loadEpisodes()
}
// MARK: - Output protocol
//
protocol HomeViewModelOutput {
    func numberOfItems(in section: Int) -> Int
    func configureCell(cell: EpisodeCellView, for index: Int)
    var reloadItems: Observable<Bool> { get }
    var loading: Observable<Bool> { get }
    var error: Observable<String> { get }
    var screenTitle: String { get }
}
// MARK: - Configure cell
protocol EpisodeCellView {
    func setTitle(_ title: String)
    func setDescription(_ desc: String)
    func setImage(_ url: String)
}

typealias HomeViewModelType = HomeViewModelInput &  HomeViewModelOutput
// MARK: - HomeViewModel
//
class HomeViewModel: HomeViewModelType {
    // MARK: - Properties
    private let useCase: EpisodeUseCase
    // MARK: - Init
    init(useCase: EpisodeUseCase = DefaultEpisodeUseCase()) {
        self.useCase = useCase
    }
    // MARK: - OUTPUT
    private var episodes: [Episode] = [] { didSet { reloadItems.value = true } }
    let reloadItems: Observable<Bool> = Observable(false)
    var loading: Observable<Bool> = Observable(true)
    let error: Observable<String> = Observable("")
    let screenTitle = NSLocalizedString("Movies", comment: "")
    /// Get number of items per sections
    /// - Parameter section: Current section
    func numberOfItems(in section: Int) -> Int {
        episodes.count
    }
    /// Configure cell
    /// - Parameters:
    ///   - cell: type of cell protocol
    ///   - index: current index path
    func configureCell(cell: EpisodeCellView, for index: Int) {
        guard episodes.indices.contains(index) else {
            return
        }
        cell.setTitle(episodes[index].title)
        cell.setDescription(episodes[index].channelTitle)
        cell.setImage(episodes[index].imageURL ?? "")
    }
    
    // MARK: - Output
    /// Load episodes from domain layer via use case
    func loadEpisodes() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4, execute: { [weak self] in
            self?.getEpisodes()
        })
    }
}
// MARK: - Load Data
private extension HomeViewModel {
    /// Get episodes
    func getEpisodes() {
        self.loading.value = true
        useCase.execute { [weak self] (result) in
            guard let self = self else { return }
            self.loading.value = false
            switch result {
            case .success(let episodes):
                self.episodes = episodes
                print("success episodes \(self.episodes)")
            case .failure(let errorMessage):
                self.error.value = errorMessage
            }
        }
    }
    
}
