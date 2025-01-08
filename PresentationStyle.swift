//
//  PresentationStyle.swift
//  NAVEGATION CUSTOM
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 7/01/25.
//

import UIKit

/// 7 tipos de Presentaciones
enum PresentationStyle {
    case automatic
    case currentContext
    case formSheet
    case fullScreen
    case overCurrentContext
    case overFullScreen
    case pageSheet

    var uikitStyle: UIModalPresentationStyle {
        switch self {
        case .automatic: return .automatic
        case .currentContext: return .currentContext
        case .formSheet: return .formSheet
        case .fullScreen: return .fullScreen
        case .overCurrentContext: return .overCurrentContext
        case .overFullScreen: return .overFullScreen
        case .pageSheet: return .pageSheet
        }
    }
}
