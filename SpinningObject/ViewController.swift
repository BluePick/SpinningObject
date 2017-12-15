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
    
    var gameQuestions = [String]()
    
    @IBOutlet weak var refreshButton: UIButton!
    @IBAction func refreshButton(_ sender: UIButton) {
        spinthebottle()
    }
    
    @IBOutlet weak var lblQuestions: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      gameQuestions = ["question one", "question two", "question three","question four","question five","question six","question seven","question eight","question nine", "question ten"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func spinthebottle(){
         self.refreshButton.rotate360DegreesRandom()
        var timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.getnewmessage), userInfo: nil, repeats: false)
        
    }
    @objc func getnewmessage(){
  
        let rndNumber = Int(arc4random_uniform(UInt32(gameQuestions.count)))
        lblQuestions.text = gameQuestions[rndNumber]
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

