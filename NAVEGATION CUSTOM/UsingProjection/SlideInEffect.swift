//
//  SlideInEffect.swift
//  NAVEGATION CUSTOM
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 7/01/25.
//

import SwiftUI

struct SlideInEffect: GeometryEffect {
    var offset: CGFloat

    var animatableData: CGFloat {
        get { offset }
        set { offset = newValue }
    }

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX: offset, y: 0))
    }
}
