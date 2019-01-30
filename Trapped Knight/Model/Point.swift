//
//  Point.swift
//  TrappedKnight
//
//  Created by Prachi Gauriar on 1/28/2019.
//  Copyright © 2019 Prachi Gauriar. All rights reserved.
//

import Foundation


/// `Point`s represent Cartesian points with integer components.
public struct Point : CustomStringConvertible, Hashable {
    /// The x-coordinate of the point.
    public var x: Int

    /// The y-coordinate of the point.
    public var y: Int


    /// Create a new `Point` with the specified x and y coordinates.
    ///
    /// - Parameters:
    ///   - x: The x-coordinate of the point.
    ///   - y: The y-coordinate of the point.
    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }


    /// The origin (0, 0).
    public static let origin = Point(x: 0, y: 0)


    public var description: String {
        return "(\(x), \(y))"
    }


    // MARK: - Hashable

    public static func ==(lhs: Point, rhs: Point) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }


    public func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}
