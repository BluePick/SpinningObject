//
//  ViewController.swift
//  SpinningObject
//
//  Created by Charles Konkol on 11/30/17.
//  Copyright © 2017 RockValleyCollege. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
var intRandom:Int!
    @IBOutlet weak var refreshButton: UIButton!
    @IBAction func refreshButton(_ sender: UIButton) {
        spinthebottle()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func spinthebottle(){
         self.refreshButton.rotate360DegreesRandom()
    }
    

}
//extension to spin object randomly
extension UIView {
    func rotate360DegreesRandom() {
        let rotateView = CABasicAnimation()
        let randonAngle = arc4random_uniform(361) + 360
        rotateView.fromValue = 0
        rotateView.toValue = Float(randonAngle) * Float(Double.pi) / 180.0
        rotateView.duration = 1
        rotateView.repeatCount = 0
        rotateView.isRemovedOnCompletion = false
        rotateView.fillMode = kCAFillModeForwards
        rotateView.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        self.layer.add(rotateView, forKey: "transform.rotation.z")
    }
}

