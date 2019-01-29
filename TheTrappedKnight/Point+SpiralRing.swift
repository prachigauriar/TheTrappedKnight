//
//  Point+SpiralRing.swift
//  TheTrappedKnight
//
//  Created by Prachi Gauriar on 1/29/2019.
//  Copyright © 2019 Prachi Gauriar. All rights reserved.
//

import Foundation


extension Point {
    /// The spiral ring that the point is on.
    var spiralRing: SpiralRing {
        let ringNumber = max(abs(x), abs(y))
        return SpiralRing(number: ringNumber)!
    }
    
    
    /// The position of the point in its spiral ring.
    var spiralRingEdgePosition: SpiralRing.EdgePosition {
        let ringNumber = spiralRing.number
        if x == ringNumber && y != -ringNumber {
            return SpiralRing.EdgePosition(edge: .right, offset: y + ringNumber - 1)
        } else if y == ringNumber {
            return SpiralRing.EdgePosition(edge: .top, offset: ringNumber - x - 1)
        } else if x == -ringNumber {
            return SpiralRing.EdgePosition(edge: .left, offset: ringNumber - y - 1)
        } else {
            return SpiralRing.EdgePosition(edge: .bottom, offset: x + ringNumber - 1)
        }
    }
    

    /// The spiral number for the point.
    var spiralNumber: Int {
        let ring = spiralRing
        guard ring.number != 0 else {
            return 1
        }
        
        let edgePosition = spiralRingEdgePosition
        return ring.minimumValue + edgePosition.edge.rawValue * ring.edgeLength + edgePosition.offset
    }
}
