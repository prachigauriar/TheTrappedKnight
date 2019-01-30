//
//  main.swift
//  TheTrappedKnight
//
//  Created by Prachi Gauriar on 1/28/2019.
//  Copyright © 2019 Prachi Gauriar. All rights reserved.
//

import Foundation


// Calculate the full knight path
var knightPath = KnightPath()
repeat { } while knightPath.next() != nil


// Print out the lattice
print("Lattice:")
for row in knightPath.containingPointLattice {
    print("    ", terminator: "")
    for point in row {
        print(String(format: "%4d", point.spiralNumber), terminator: " ")
    }
    print()
}

// Print out the path
print("\nPath:")
for element in knightPath.elements {
    print(String(format: "    %4d\t%@", element.spiralNumber, element.point.description))
}
