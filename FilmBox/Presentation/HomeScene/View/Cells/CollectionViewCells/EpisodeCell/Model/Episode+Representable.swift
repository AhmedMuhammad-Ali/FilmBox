//
//  Episode+Representable.swift
//  FilmBox
//
//  Created by Ahmed Ali on 03/07/2022.
//

import UIKit

extension Episode: EpisodeCellRepresentable {
    var episodeTitle: String {
        title
    }

    var episodeDescription: String {
        channelTitle
    }

    var imageURL: String? {
        imagePath
    }

    var placeholderImage: UIImage? {
        .placeHolder
    }
}
