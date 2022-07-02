//
//  NetworkManager.swift
//  FilmBox
//
//  Created by Ahmed Ali on 27/11/2020.
//

import Foundation
import Moya

protocol NetworkService {
    func request<T: Decodable>(_ target: AppEndPoint, completion: @escaping (RequestResult<T, String>) -> Void)
}
// MARK: - NetworkManager
class NetworkManager: NetworkService {
    
    // MARK: - Properties
    
    /// Network provider
    lazy private var provider = MoyaProvider<AppEndPoint>(
        plugins: [loggingPlugin]
    )
    
    /// Generic network call
    func request<T: Decodable>(_ target: AppEndPoint, completion: @escaping (RequestResult<T, String>) -> Void) {
        provider.request(target) { result in
            switch result {
            case .success(let response):
                let result = self.handleNetworkResponse(response.statusCode)
                switch result {
                case .success:
                    do {
                        let apiResponse = try JSONDecoder().decode(T.self, from: response.data)
                        completion(.success(apiResponse))
                    } catch {
                        completion(.failure(error.localizedDescription))
                    }
                case .failure(let networkFailureError):
                    completion(.failure(networkFailureError))
                }
            case .failure(let error):
                completion(.failure(error.localizedDescription))
            }
        }
    }
}

// MARK: - Helpers
//
private extension NetworkManager {
    
    // MARK: - Properties
    
    var loggingPlugin: NetworkLoggerPlugin {
        NetworkLoggerPlugin(
            configuration: .init(logOptions: .verbose)
        )
    }

    /// Handle Network Response
    func handleNetworkResponse(_ statusCode: Int) -> NetworkResult<String> {
        
        switch statusCode {
        
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
            
        }
    }
}
