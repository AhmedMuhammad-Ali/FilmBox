//
//  BaseURL.swift
//  FilmBox
//
//  Created by Ahmed Ali on 27/11/2020.
//

import Foundation

// MARK: - BaseURL

struct BaseURL {
    
    /// Base URL
    static var url: URL {
        guard let url = URL(string: "https://pastebin.com/raw/") else {
            fatalError("Unable to create \(#function)")
        }
        return url
    }
}
