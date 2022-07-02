//
//  State.swift
//  FilmBox
//
//  Created by Ahmed Ali on 28/11/2020.
//

import Foundation

public enum State<Success> {

    /// A success, storing a `Success` value.
    case success(Success)

    /// A failure, storing a `Error` value.
    case failure(String)

    /// A loading, indicates when loading starts
    case loading
    
}

extension State: Equatable {
    
    public static func == (lhs: State<Success>, rhs: State<Success>) -> Bool {
        switch (lhs, rhs) {
        case (.success, .success):
            return true
        case (.failure, .failure):
            return true
        case (.loading, .loading):
            return true
        default:
            return false
        }
    }
    
}
