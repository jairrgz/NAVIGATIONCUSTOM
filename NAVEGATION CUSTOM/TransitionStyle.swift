//
//  TransitionStyle.swift
//  NAVEGATION CUSTOM
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 7/01/25.
//

import UIKit

/// 4 tipos de  transiciones
enum TransitionStyle {
    case coverVertical
    case flipHorizontal
    case crossDissolve
    case partialCurl
    
    var uikitStyle: UIModalTransitionStyle {
        switch self {
        case .coverVertical: return .coverVertical
        case .flipHorizontal: return .flipHorizontal
        case .crossDissolve: return .crossDissolve
        case .partialCurl: return .partialCurl
        }
    }
}   
