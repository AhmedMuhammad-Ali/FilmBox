//
//  ChannelMainResponseDTO.swift
//  FilmBox
//
//  Created by Ahmed Ali on 02/07/2022.
//

import Foundation
// MARK: - ChannelMainResponseDTO
//
struct ChannelMainResponseDTO: Decodable {
    let data: ChannelResponseDTO?
}
// MARK: - ChannelResponseDTO
//
struct ChannelResponseDTO: Decodable {
    let channels: [ChannelDTO]?
}
// MARK: - ChannelDTO
//
struct ChannelDTO: Decodable {
    let title: String?
    let series: [SeriesDTO]?
    let mediaCount: Int?
    let latestMedia: [LatestMediaDTO]?
    let iconAsset: IconAssetDTO?
    let coverAsset: CoverAssetDTO?
    let slug: String?
}
// MARK: - IconAssetDTO
struct IconAssetDTO: Decodable {
    let thumbnailURL: String?
    let url: String?
    enum CodingKeys: String, CodingKey {
        case thumbnailURL = "thumbnailUrl"
        case url
    }
}
// MARK: - LatestMediaDTO
struct LatestMediaDTO: Decodable {
    let type: LatestMediaTypeDTO?
    let title: String?
    let coverAsset: CoverAssetDTO?
}
enum LatestMediaTypeDTO: String, Codable {
    case course
    case video
}
// MARK: - SeriesDTO
struct SeriesDTO: Decodable {
    let title: String?
    let coverAsset: CoverAssetDTO?
}
