//
//  SpiralRing.swift
//  TheTrappedKnight
//
//  Created by Prachi Gauriar on 1/28/2019.
//  Copyright © 2019 Prachi Gauriar. All rights reserved.
//

import Foundation


/// `SpiralRing`s provide information about spiral rings. Suppose we have a point lattice in which each point has
/// integer coordinates. A spiral ring is a particular arrangement of integers on that lattice that works as follows:
/// we assign the point `(0, 0)` the value 1. From there, we number the other points by writing the remaining positive
/// integers in a counter-clockwise spiral arrangement, like so:
///
///     ┌──────────────────────────────────┐
///     │ 37   36   35   34   33   32   31 │
///     │    ┌────────────────────────┐    │
///     │ 38 │ 17   16   15   14   13 │ 30 │
///     │    │    ┌──────────────┐    │    │
///     │ 39 │ 18 │  5    4    3 │ 12 │ 29 │
///     │    │    │     ┌───┐    │    │    │
///     │ 40 │ 19 │  6  │ 1 │  2 │ 11 │ 28 │
///     │    │    │     └───┘    │    │    │
///     │ 41 │ 20 │  7    8    9 │ 10 │ 27 │
///     │    │    └─── Ring  1 ──┘    │    │
///     │ 42 │ 21   22   23   24   25 │ 26 │
///     │    └──────── Ring  2 ───────┘    │
///     │ 43   44   45   46   47   48   49 │ …
///     └───────────── Ring  3 ────────────┘
///
/// We define Ring *i* as the spiral ring containing the points on the lattice `(x, y)` such that `x = ±i` or `y = ±i`.
/// The minimum value in this ring is `(2i - 1)² + 1`; the maximum value is `(2i + 1)²`.
///
/// The `SpiralRing` type provides useful values when working with spiral rings, including the ring’s width, minimum
/// and maximum values, and edge length.
struct SpiralRing {
    /// `Edge`s represent the side of a spiral ring that a point appears on.
    enum Edge : Int, CustomStringConvertible {
        /// The right edge. A point `P = (x, y)` is on the right edge of Ring *i* if `x = i` and `y ≠ -i`.
        case right

        /// The top edge. A point `P = (x, y)` is on the top edge of Ring *i* if `y = i` and `x ≠ i`.
        case top

        /// The left edge. A point `P = (x, y)` is on the left edge of Ring *i* if `x = -i` and `y ≠ i`.
        case left

        // The bottom edge. A point `P = (x, y)` is on the bottom edge of Ring *i* if `y = -i` and `x ≠ -i`.
        case bottom


        var description: String {
            switch self {
            case .right:
                return "right"
            case .top:
                return "top"
            case .left:
                return "left"
            case .bottom:
                return "bottom"
            }
        }
    }


    /// `EdgePosition`s pair an edge with an integer offset. The offset is the distance from the edge’s minimum value.
    struct EdgePosition {
        /// The position’s edge.
        let edge: Edge

        /// The position’s offset. This value is between 0 and `ring.edgeLength - 1`.
        let offset: Int
    }


    /// The ring’s number.
    let number: Int


    /// Creates a new spiral ring with the specified ring number. Returns `nil` when `number` is negative.
    ///
    /// - Parameter number: The number of the ring.
    init?(number: Int) {
        guard number >= 0 else {
            return nil
        }

        self.number = number
    }


    /// Returns the width of the ring. For Ring *i*, this is  `2i + 1`.
    var width: Int {
        return 2 * number + 1
    }


    /// Returns the minimum value of the ring. For Ring *i*, this is  `(2i - 1)² + 1`, or one larger than Ring *i - 1*’s
    /// maximum value.
    var minimumValue: Int {
        return SpiralRing(number: number - 1).map { $0.maximumValue + 1 } ?? 1
    }


    /// Returns the maximum value of the ring. For Ring *i*, this is `(2i + 1)²`.
    var maximumValue: Int {
        return width * width
    }


    /// Returns the length of an edge in the ring. For Ring *i*, this is `2i`. See `SpiralRing.Edge` for more
    /// information about the definition of edges.
    var edgeLength: Int {
        return 2 * number
    }


    /// The points for spiral ring organized in rows.
    var pointLattice: [[Point]] {
        return (-number...number).reversed().map { (y) in
            (-number...number).map { (x) in
                return Point(x: x, y: y)
            }
        }
    }
}
