//
//  EpisodeRepository.swift
//  FilmBox
//
//  Created by Ahmed Ali on 02/07/2022.
//

import Foundation

// Episodes completion consists of array of Media in success case
// OR string error message in case failure
typealias EpisodesCompletion = (RequestResult<[MediaDTO], String>) -> Void

// MARK: - EpisodeRepository
protocol EpisodeRepository {
    func getEpisodes(onCompletion: @escaping EpisodesCompletion)
}
