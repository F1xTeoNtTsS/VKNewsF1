//
//  NewsfeedInteractor.swift
//  VKNewsF1
//
//  Created by Dmitrii Abanin on 8/6/20.
//  Copyright (c) 2020 F1xTeoNtTsS. All rights reserved.
//

import UIKit

protocol NewsfeedBusinessLogic {
  func makeRequest(request: Newsfeed.Model.Request.RequestType)
}

class NewsfeedInteractor: NewsfeedBusinessLogic {

  var presenter: NewsfeedPresentationLogic?
  var service: NewsfeedService?
    
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
  
  func makeRequest(request: Newsfeed.Model.Request.RequestType) {
    if service == nil {
      service = NewsfeedService()
    }
    
    switch request {
    
    case .getNewsFeed:
        fetcher.getFeed { [weak self](feedResponse) in
            
            guard let feedResponse = feedResponse else { return }
            self?.presenter?.presentData(response: Newsfeed.Model.Response.ResponseType.presentNewsfeed(feed: feedResponse))
        }
    }
  }
  
}
