//
//  DefaultEpisodeRepository.swift
//  FilmBox
//
//  Created by Ahmed Ali on 02/07/2022.
//

import Foundation
import SystemConfiguration

final class DefaultEpisodeRepository {
    // MARK: - Properties
    let networkManager: NetworkService
    // MARK: - Init
    init(network: NetworkService = NetworkManager()) {
        self.networkManager = network
    }
}
extension DefaultEpisodeRepository: EpisodeRepository {
    /// Get episodes
    func getEpisodes(onCompletion: @escaping (RequestResult<[Episode], String>) -> Void) {
        
        networkManager.request(.getEpisodes) { (result: RequestResult<EpisodeMainResponseDTO, String>) in
            
            switch result {
            case .success(let data):
                guard let episodes = data.data?.toDomain()  else {
                    onCompletion(.failure("media not found"))
                    return
                }
                onCompletion(.success(episodes))
            case .failure(let errorMessage):
                onCompletion(.failure(errorMessage))
            }
        }
    }
}
