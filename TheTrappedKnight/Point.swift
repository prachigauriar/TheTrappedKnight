//
//  Point.swift
//  TheTrappedKnight
//
//  Created by Prachi Gauriar on 1/28/2019.
//  Copyright © 2019 Prachi Gauriar. All rights reserved.
//

import Foundation


/// `Point`s represent Cartesian points with integer components.
struct Point : CustomStringConvertible, Hashable {
    /// The x-coordinate of the point.
    var x: Int

    /// The y-coordinate of the point.
    var y: Int


    /// Create a new `Point` with the specified x and y coordinates.
    ///
    /// - Parameters:
    ///   - x: The x-coordinate of the point.
    ///   - y: The y-coordinate of the point.
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }


    /// The origin (0, 0).
    static let origin = Point(x: 0, y: 0)


    var description: String {
        return "(\(x), \(y))"
    }


    // MARK: - Hashable

    static func ==(lhs: Point, rhs: Point) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }


    func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}
