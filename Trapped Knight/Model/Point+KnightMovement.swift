//
//  Point+KnightMovement.swift
//  TrappedKnight
//
//  Created by Prachi Gauriar on 1/29/2019.
//  Copyright © 2019 Prachi Gauriar. All rights reserved.
//

import Foundation


extension Point {
    /// The points that a knight could legally move to (using standard rules of Chess) when starting from this point.
    public var legalKnightDestinations: Set<Point> {
        return [
            Point(x: x + 1, y: y + 2),
            Point(x: x - 1, y: y + 2),
            Point(x: x - 2, y: y + 1),
            Point(x: x - 2, y: y - 1),
            Point(x: x - 1, y: y - 2),
            Point(x: x + 1, y: y - 2),
            Point(x: x + 2, y: y - 1),
            Point(x: x + 2, y: y + 1)
        ]
    }
}
