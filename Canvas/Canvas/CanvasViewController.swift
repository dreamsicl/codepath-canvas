//
//  CanvasViewController.swift
//  Canvas
//
//  Created by Vanna L Phong on 4/12/17.
//  Copyright © 2017 Vanna L Phong. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController {

    @IBOutlet weak var trayView: UIView!
    var trayOriginalCenter: CGPoint!
    var trayDownOffset: CGFloat!
    var trayUp: CGPoint!
    var trayDown: CGPoint!
    
    @IBAction func didPanTray(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: view)
        
        if (sender.state == .began) {
            
            trayOriginalCenter = trayView.center
            
        } else if (sender.state == .changed) {
            
            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
            
        } else if (sender.state == .ended) {
            
            let velocity = sender.velocity(in: view)
            
            if velocity.y > 0 {
                
                UIView.animate(withDuration: 0.4, animations: { 
                    self.trayView.center = self.trayDown
                })
                
            } else {
                UIView.animate(withDuration: 0.4, animations: {
                    self.trayView.center = self.trayUp
                })
                
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        trayDownOffset = 160
        trayUp = trayView.center
        trayDown = CGPoint(x: trayView.center.x, y: trayView.center.y + trayDownOffset)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
