//
//  ChannelCellRepresentable.swift
//  IbtikarTask
//
//  Created by Ahmed Ali on 28/11/2020.
//

import Foundation

// MARK: - ChannelCellRepresentable
//
protocol ChannelCellRepresentable: ImageRepresentable {
    
    var channelHeaderTitle: String { get }
    var countTitle: String { get }
    var cellType: ChannelType { get }
}
