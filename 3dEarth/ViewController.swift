//
//  ViewController.swift
//  3dEarth
//
//  Created by Lin Cheng on 04/12/2017.
//  Copyright © 2017 Lin Cheng. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let scene = SCNScene()
        
        // Camera Node
        let camaraNode = SCNNode()
        camaraNode.camera = SCNCamera()
        camaraNode.position = SCNVector3(x: 0, y: 0, z: 5)
        scene.rootNode.addChildNode(camaraNode)
        
        // Light Node
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 2)
        scene.rootNode.addChildNode(lightNode)
        
        // Particle
        let stars = SCNParticleSystem(named: "StarsParticles.scnp", inDirectory: nil)
        scene.rootNode.addParticleSystem(stars!)
        
        // Earth Node
        let earthNode = EarthNode()
        scene.rootNode.addChildNode(earthNode)
        
        let sceneView = self.view as! SCNView
        sceneView.scene = scene
        
        sceneView.showsStatistics = true
        sceneView.backgroundColor = UIColor.black
        sceneView.allowsCameraControl = true
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

}

