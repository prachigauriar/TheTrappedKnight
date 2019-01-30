//
//  TrappedKnightViewController.swift
//  The Trapped Knight
//
//  Created by Prachi Gauriar on 1/29/2019.
//  Copyright © 2019 Prachi Gauriar. All rights reserved.
//

import Cocoa


final class TrappedKnightViewController : NSViewController {
    private var isRunning = false
    
    // Views
    @IBOutlet weak var resetButton: NSButton!
    @IBOutlet weak var toggleGenerationButton: NSButton!


    @IBAction func takeFrequency(from slider: NSSlider) {
        print(slider.doubleValue)
    }


    @IBAction func toggleGeneration(_ sender: NSButton) {
        isRunning.toggle()
        
        if isRunning {
            start()
        } else {
            stop()
        }
    }


    @IBAction func reset(_ sender: NSButton) {
        stop()
    }


    private func start() {
        toggleGenerationButton.title = NSLocalizedString("Stop", comment: "title of button that stops the Chaos Game")
    }


    private func stop() {
        toggleGenerationButton.title = NSLocalizedString("Start", comment: "title of button that starts the Chaos Game")
    }
}
