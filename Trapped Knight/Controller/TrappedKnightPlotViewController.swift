//
//  TrappedKnightPlotViewController.swift
//  Trapped Knight
//
//  Created by Prachi Gauriar on 1/29/2019.
//  Copyright © 2019 Prachi Gauriar. All rights reserved.
//

import Cocoa
import SceneKit


final class TrappedKnightPlotViewController : NSViewController {
    private var scene = SCNScene()

    // View
    @IBOutlet weak var pointView: SCNView!


    public override func viewDidLoad() {
        super.viewDidLoad()
        pointView.backgroundColor = .black
    }


    public func reset() {
        let scene = SCNScene()
        self.scene = scene
        pointView.scene = scene
    }
}
