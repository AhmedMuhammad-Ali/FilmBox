//
//  Channel.swift
//  FilmBox
//
//  Created by Ahmed Ali on 02/07/2022.
//

import Foundation

struct Channel {
    let title: String
    let type: ChannelType
    let series: [Series]
    let seriesCount: Int?
    let course: [Course]
    let mediaCount: Int? 
}

enum ChannelType {
    case course
    case series
}
