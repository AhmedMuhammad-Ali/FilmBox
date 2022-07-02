//
//  DefaultChannelRepository.swift
//  FilmBox
//
//  Created by Ahmed Ali on 02/07/2022.
//

import Foundation

final class DefaultChannelRepository {
    // MARK: - Properties
    let networkManager: NetworkService
    // MARK: - Init
    init(network: NetworkService = NetworkManager()) {
        self.networkManager = network
    }
}
extension DefaultChannelRepository: ChannelRepository {
    /// Get channels
    func getChannels(onCompletion: @escaping (RequestResult<[Channel], String>) -> Void) {
        networkManager.request(.getChannels) { (result: RequestResult<ChannelMainResponseDTO, String>) in
            
            switch result {
            case .success(let data):
                guard let channels = data.data?.toDomain() else {
                    onCompletion(.failure("channels not found"))
                    return
                }
                onCompletion(.success(channels))
            case .failure(let errorMessage):
                onCompletion(.failure(errorMessage))
            }
        }
    }
}
