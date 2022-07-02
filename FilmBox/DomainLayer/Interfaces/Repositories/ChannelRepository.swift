//
//  ChannelRepository.swift
//  FilmBox
//
//  Created by Ahmed Ali on 02/07/2022.
//

import Foundation

// Channels completion consists of array of `Channel` in success case
// OR string error message in case failure
typealias ChannelsCompletion = (RequestResult<[ChannelDTO], String>) -> Void

// MARK: - ChannelRepository
protocol ChannelRepository {
    func getChannels(onCompletion: @escaping ChannelsCompletion)
}
