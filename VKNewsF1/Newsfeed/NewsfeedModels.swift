//
//  NewsfeedModels.swift
//  VKNewsF1
//
//  Created by Dmitrii Abanin on 8/6/20.
//  Copyright (c) 2020 F1xTeoNtTsS. All rights reserved.
//

import UIKit

enum Newsfeed {
   
  enum Model {
    struct Request {
      enum RequestType {
        case some
        case getFeed
      }
    }
    struct Response {
      enum ResponseType {
        case some
        case presentNewsfeed
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case some
        case displayNewsFeed
      }
    }
  }
  
}