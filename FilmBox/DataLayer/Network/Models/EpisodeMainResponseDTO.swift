//
//  EpisodeMainResponseDTO.swift
//  FilmBox
//
//  Created by Ahmed Ali on 02/07/2022.
//

import Foundation
// MARK: - EpisodeMainResponseDTO
//
struct EpisodeMainResponseDTO: Decodable {
    let data: EpisodeResponseDTO?
}
// MARK: - EpisodeResponseDTO
//
struct EpisodeResponseDTO: Decodable {
    let media: [EpisodeDTO]?
}
// MARK: - MediaDTO
//
struct EpisodeDTO: Decodable {
    let type, title: String?
    let coverAsset: CoverAssetDTO?
    let channel: ChannelsDTO?
}
// MARK: - ChannelsDTO
//
struct ChannelsDTO: Decodable {
    let title: String?
}
// MARK: - CoverAssetDTO
//
struct CoverAssetDTO: Codable {
    let url: String?
}

// MARK: - Mappings to Domain
extension EpisodeResponseDTO {
    func toDomain() -> [Episode] {
        return media?.map { $0.toDomain() } ?? []
    }
}

extension EpisodeDTO {
    func toDomain() -> Episode {
        return .init(title: title ?? "",
                     channelTitle: channel?.title ?? "",
                     imagePath: coverAsset?.url ?? "",
                     type: type ?? "")
    }
}
