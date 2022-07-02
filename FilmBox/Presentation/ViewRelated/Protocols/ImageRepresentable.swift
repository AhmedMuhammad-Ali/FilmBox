//
//  ImageRepresentable.swift
//  FilmBox
//
//  Created by Ahmed Ali on 02/07/2022.
//
import UIKit

// MARK: - ImageRepresentable
//
protocol ImageRepresentable {
    var imageURL: String? { get }
    var placeholderImage: UIImage? { get }
}
