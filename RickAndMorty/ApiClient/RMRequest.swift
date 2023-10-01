//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Масуд Гаджиев on 26.09.2023.
//

import Foundation

final class RMRequest{
    // Base URL
    // Endpoint
    // Path components
    // Query parametrs
    
    /// API Constatns
    private struct Constans{
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    /// Desired endpoint
    let endPoint: RMEndpoint
    /// Path components for API, if any
    private let pathComponents: Set<String>
    /// Query arguments for API, ia any
    private let queryParametrs: [URLQueryItem]
    
    /// Constructed url for the api request in string format
    private var urlString: String {
           var string = Constans.baseUrl
           string += "/"
           string += endPoint.rawValue

           if !pathComponents.isEmpty {
               pathComponents.forEach({
                   string += "/\($0)"
               })
           }

           if !queryParametrs.isEmpty {
               string += "?"
               let argumentString = queryParametrs.compactMap({
                   guard let value = $0.value else { return nil }
                   return "\($0.name)=\(value)"
               }).joined(separator: "&")

               string += argumentString
           }

           return string
       }
        /// Computed & constructed API url
        public var url: URL? {
            return URL(string: urlString)
            
        }
    
    /// Desired http method
    public let httpMethod = "GET"
        
    /// Construct request
    /// - Paramters;
    /// - endpoint: Target endpoint
    /// - pathComponents: Collection of Path components
    /// - queryParametrs: Collection of query parametrs
        public init(
                endpoint: RMEndpoint,
                pathComponents: [String] = [],
                queryParameters: [URLQueryItem] = []
            ) {
                self.endPoint = endpoint
                self.pathComponents = pathComponents
                self.queryParametrs = queryParameters
            }
    }
    

