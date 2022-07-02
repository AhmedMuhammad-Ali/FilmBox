//
//  BaseViewModel.swift
//  FilmBox
//
//  Created by Ahmed Ali on 28/11/2020.
//

import Foundation

// MARK: - Base View Model
//
class BaseViewModel {

    typealias Element = Any

    /// State
    var state = PublishSubject<State<Element>>()

}
