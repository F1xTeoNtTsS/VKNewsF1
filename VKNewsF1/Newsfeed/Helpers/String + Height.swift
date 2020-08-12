//
//  String + Height.swift
//  VKNewsF1
//
//  Created by Dmitrii Abanin on 8/11/20.
//  Copyright © 2020 F1xTeoNtTsS. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func height(width: CGFloat, font: UIFont) -> CGFloat {
        
        let textSize = CGSize(width: width, height: .greatestFiniteMagnitude)
        
        let size = self.boundingRect(with: textSize,
                                     options: .usesLineFragmentOrigin,
                                     attributes: [NSAttributedString.Key.font : font],
                                     context: nil)
        return ceil(size.height)
    }
}
