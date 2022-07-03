//
//  EpisodeUseCase.swift
//  FilmBox
//
//  Created by Ahmed Ali on 03/07/2022.
//

import Foundation

protocol EpisodeUseCase {
    func execute(onCompletion: @escaping EpisodesCompletion)
}

final class DefaultEpisodeUseCase: EpisodeUseCase {

    private let episodeRepository: EpisodeRepository

    init(episodeRepository: EpisodeRepository = DefaultEpisodeRepository()) {
        self.episodeRepository = episodeRepository
    }

    func execute(onCompletion: @escaping EpisodesCompletion) {
        return episodeRepository.getEpisodes(onCompletion: onCompletion)
    }
}
