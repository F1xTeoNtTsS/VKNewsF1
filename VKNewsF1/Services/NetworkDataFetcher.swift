//
//  NetworkDataFetcher.swift
//  VKNewsF1
//
//  Created by Dmitrii Abanin on 8/5/20.
//  Copyright © 2020 F1xTeoNtTsS. All rights reserved.
//

import Foundation

protocol DataFetcher {
    
    func getFeed(response: @escaping (FeedResponse?) -> ())
}

struct NetworkDataFetcher: DataFetcher {
    
    let networking: Networking
    
    init(networking: Networking) {
        
        self.networking = networking
    }
    
    
    func getFeed(response: @escaping (FeedResponse?) -> ()) {
        let params = ["filters": "post, photo"]
        networking.request(path: API.newsFeed, params: params) { (data, error) in
            if let error = error {
                print("Error receive requesting data: \(error.localizedDescription)")
                response(nil)
            }
            
            let decoded = self.decodeJSON(type: FeedResponseWrapped.self, from: data)
            response(decoded?.response)
            
        }
    }
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = from, let response = try? decoder.decode(type.self, from: data) else { return nil }
        return response
    }
    
    
}
