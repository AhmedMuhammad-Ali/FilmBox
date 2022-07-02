//
//  DefaultCategoryRepository.swift
//  FilmBox
//
//  Created by Ahmed Ali on 03/07/2022.
//

import Foundation

final class DefaultCategoryRepository {
    // MARK: - Properties
    let networkManager: NetworkService
    // MARK: - Init
    init(network: NetworkService = NetworkManager()) {
        self.networkManager = network
    }
}
extension DefaultCategoryRepository: CategoryRepository {
    func getCategories(onCompletion: @escaping  (RequestResult<[Category], String>) -> Void) {
        networkManager.request(.getCategories) { (result: RequestResult<CategoryMainResponseDTO, String>) in
            switch result {
            case .success(let data):
                guard let categories = data.data?.toDomain() else {
                    onCompletion(.failure("categories not found"))
                    return
                }
                onCompletion(.success(categories))
            case .failure(let errorMessage):
                onCompletion(.failure(errorMessage))
            }
        }
    }
}
