//
//  EndPoint+TargetType.swift
//  FilmBox
//
//  Created by Ahmed Ali on 27/11/2020.
//

import Foundation
import Moya

// MARK: - EndPoint + TargetType
//
extension AppEndPoint: TargetType {
    
    var baseURL: URL {
        return BaseURL.url
    }
    
    var path: String {
        switch self {
        
        // MARK: - Home
        
        case .getCategories:
            return "A0CgArX3"
        case .getChannels:
            return "Xt12uVhM"
        case .getEpisodes:
            return "z5AExTtw"
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        
        // MARK: - Home
        
        case .getCategories:
            return .requestPlain
        case .getChannels:
            return .requestPlain
        case .getEpisodes:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
    
}
