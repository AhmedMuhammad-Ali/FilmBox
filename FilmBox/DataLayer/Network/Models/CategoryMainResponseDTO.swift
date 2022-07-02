//
//  CategoryMainResponseDTO.swift
//  FilmBox
//
//  Created by Ahmed Ali on 02/07/2022.
//

import Foundation
// MARK: - CategoryMainResponseDTO
//
struct CategoryMainResponseDTO: Decodable {
    let data: CategoryResponseDTO?
}
// MARK: - CategoryResponseDTO
//
struct CategoryResponseDTO: Decodable {
    let categories: [CategoryDTO]?
}
// MARK: - CategoryDTO
struct CategoryDTO: Decodable {
    let name: String?
}
