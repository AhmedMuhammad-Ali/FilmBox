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
    let media: [MediaDTO]?
}
// MARK: - MediaDTO
//
struct MediaDTO: Decodable {
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
