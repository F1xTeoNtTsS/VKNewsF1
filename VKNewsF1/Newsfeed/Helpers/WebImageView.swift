//
//  WebImageView.swift
//  VKNewsF1
//
//  Created by Dmitrii Abanin on 8/7/20.
//  Copyright © 2020 F1xTeoNtTsS. All rights reserved.
//

import UIKit

class WebImageView: UIImageView {
    
    func set(imageUrl: String?) {
        guard let imageUrl = imageUrl, let url = URL(string: imageUrl) else {
            self.image = nil
            return }
        
        if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            
            self.image = UIImage(data: cachedResponse.data)
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error ) in
            
            DispatchQueue.main.async {
                if let data = data, let response = response {
                    self?.image = UIImage(data: data)
                    self?.handleLoadedimage(data: data, response: response)
                }
            }
        }
        dataTask.resume()
    }
    
    private func handleLoadedimage(data: Data, response: URLResponse) {
        
        guard let responseUrl = response.url else { return }
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: responseUrl))
    }
}
