//
//  NetworkError.swift
//  FilmBox
//
//  Created by Ahmed Ali on 27/11/2020.
//

import Foundation

// MARK: - NetworkResult
//
enum NetworkResult<String> {
    case success
    case failure(String)
}

// MARK: - NetworkResponse
//
enum NetworkResponse: String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
    case noInternet = "Please check your internet connection and try again later."
}

// MARK: - Request Result
//
enum RequestResult<T, String> {
    case success(T)
    case failure(String)
}
