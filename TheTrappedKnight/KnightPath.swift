//
//  KnightPath.swift
//  TheTrappedKnight
//
//  Created by Prachi Gauriar on 1/29/2019.
//  Copyright © 2019 Prachi Gauriar. All rights reserved.
//

import Foundation


/// A `KnightPath` represents a path that a Knight takes in the Trapped Knight problem. The Knight starts at an initial
/// point and then successively moves to other points by invoking the `next()` method.
struct KnightPath {
    /// `KnightPath.Element`s pair a point with the spiral number at that point.
    struct Element : Comparable, CustomStringConvertible {
        /// The element’s point.
        let point: Point

        /// The element’s spiral number.
        let spiralNumber: Int


        /// Creates a new `Element` with the specified point.
        ///
        /// - Parameter point: The point for the new element.
        init(point: Point) {
            self.point = point
            self.spiralNumber = point.spiralNumber
        }


        var description: String {
            return String(format: "%4d\t%@", spiralNumber, String(describing: point))
        }


        static func ==(lhs: Element, rhs: Element) -> Bool {
            return lhs.spiralNumber == rhs.spiralNumber
        }


        static func <(lhs: Element, rhs: Element) -> Bool {
            return lhs.spiralNumber < rhs.spiralNumber
        }
    }


    /// The set of elements in the path. This is updated upon each invocation of `next()` and is guaranteed to be
    /// non-empty.
    private(set) var elements: [Element]

    /// The set of previously visited points.
    private var visitedPoints: Set<Point>


    /// Creates a new `KnightPath` with the specified initial point.
    ///
    /// - Parameter initialPoint: The initial position of the Knight.
    init(initialPoint: Point = .origin) {
        self.visitedPoints = [initialPoint]
        self.elements = [Element(point: initialPoint)]
    }


    /// Returns the last element in the path.
    private var lastElement: Element {
        return elements.last!
    }


    /// Returns the point lattice for the smallest Spiral Ring that contains all the points in the path.
    var containingPointLattice: [[Point]] {
        let maxRingNumber = knightPath.elements.map { $0.point.spiralRing.number }.max()!
        return SpiralRing(number: maxRingNumber)!.pointLattice
    }


    /// Moves the knight to the next position in its path and returns that position.
    ///
    /// - Returns: The new position of the knight or `nil` if the knight has no legal moves.
    mutating func next() -> Element? {
        guard let nextElement = lastElement.point.legalKnightDestinations.subtracting(visitedPoints).map(Element.init(point:)).min() else {
            return nil
        }

        elements.append(nextElement)
        visitedPoints.insert(nextElement.point)
        return nextElement
    }
}
