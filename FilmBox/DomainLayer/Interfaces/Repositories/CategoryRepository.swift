//
//  CategoryRepository.swift
//  FilmBox
//
//  Created by Ahmed Ali on 02/07/2022.
//

import Foundation

// Categories completion consists of array of `Category` in success case
// OR string error message in case failure

typealias CategoriesCompletion = (RequestResult<[CategoryDTO], String>) -> Void

// MARK: - CategoryRepository
protocol CategoryRepository {
    func getCategories(onCompletion: @escaping CategoriesCompletion)
}
