//
//  GameViewController.swift
//  Brickz
//
//  Created by Julian Cearley on 1/16/18.
//  Copyright © 2018 Julian Cearley. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import GoogleMobileAds
import AVFoundation

class GameViewController: UIViewController, GADInterstitialDelegate {
    
    var interstitial: GADInterstitial!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            _ = view as SKView!
            
            let scene = TitleScene(size: CGSize(width: view.frame.width, height: view.frame.height)) // 768 x 1024 if portrait
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFill
            scene.anchorPoint = CGPoint(x: 0, y: 0)
            
            // Present the scene
            view.presentScene(scene)
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = false
            view.showsNodeCount = false
            view.showsPhysics = false
            
        }
        
        self.interstitial = createAndLoadInterstitial()
        
        let request = GADRequest()
        request.testDevices = ["kGADSimulatorID"]
        self.interstitial.load(request)
        
        NotificationCenter.default.addObserver(self, selector: #selector(GameViewController.displayAd), name: NSNotification.Name(rawValue: "displayAdKey"), object: nil)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let skView = self.view as! SKView
        if let scene = skView.scene {
            var size = scene.size
            let newHeight = skView.bounds.size.height / skView.bounds.width * size.width
            if newHeight > size.height {
                scene.anchorPoint = CGPoint(x: 0, y: (newHeight - scene.size.height) / 2.0 / newHeight)
                size.height = newHeight
                scene.size = size
            }
        }
        
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func createAndLoadInterstitial() -> GADInterstitial {
        
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-7869974004265463/3979716614")
        interstitial.delegate = self
        interstitial.load(GADRequest())
        return interstitial
        
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        
        self.interstitial = createAndLoadInterstitial()
    }
    
    @objc func displayAd() {
        
        if interstitial.isReady {
            
            self.interstitial.present(fromRootViewController: self)
        }
        
    }
    
}
