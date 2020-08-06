//
//  NewsfeedPresenter.swift
//  VKNewsF1
//
//  Created by Dmitrii Abanin on 8/6/20.
//  Copyright (c) 2020 F1xTeoNtTsS. All rights reserved.
//

import UIKit

protocol NewsfeedPresentationLogic {
  func presentData(response: Newsfeed.Model.Response.ResponseType)
}

class NewsfeedPresenter: NewsfeedPresentationLogic {
  weak var viewController: NewsfeedDisplayLogic?
  
  func presentData(response: Newsfeed.Model.Response.ResponseType) {
    switch response {
    case .some:
        print(".some Presenter")
    case .presentNewsfeed:
        print(".presentNewsfeed Presenter")
        viewController?.displayData(viewModel: .displayNewsFeed)
    }
  }
  
}
