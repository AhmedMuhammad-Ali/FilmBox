//
//  Episode+Representable .swift
//  IbtikarTask
//
//  Created by Ahmed Ali on 28/11/2020.
//

import Foundation

protocol EpisodeCellRepresentable: ImageRepresentable {
    var episodeTitle: String { get }
    var episodeDescription: String { get }
}
