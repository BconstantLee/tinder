//
//  CardsViewController.swift
//  Tinder
//
//  Created by Bconsatnt on 4/6/17.
//  Copyright © 2017 Bconsatnt. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    var cardInitialCenter: CGPoint!
    var check: CGFloat!
    @IBOutlet weak var imageCell: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardInitialCenter = imageCell.center

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onPic(_ sender: AnyObject) {
        let location = sender.location(in: view)
//        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            if location.y > cardInitialCenter.y {
                check = -1
            } else {check = 1}

        } else if sender.state == .changed {
            imageCell.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y + translation.y)
            imageCell.transform = CGAffineTransform(rotationAngle: check * CGFloat(Double(translation.x) * M_PI / 1080))
        } else if sender.state == .ended {
            if translation.x > 50 {
                UIView.animate(withDuration:0.4, animations: {
                    self.imageCell.center = CGPoint(x: self.cardInitialCenter.x + self.imageCell.frame.width, y: self.cardInitialCenter.y)
                })
            } else if translation.x < -50 {
                UIView.animate(withDuration:0.4, animations: {
                    self.imageCell.center = CGPoint(x: self.cardInitialCenter.x - self.imageCell.frame.width, y: self.cardInitialCenter.y)
                })
            } else {
                UIView.animate(withDuration:0.4, animations: {
                    self.imageCell.center = self.cardInitialCenter
                    self.imageCell.transform = CGAffineTransform.identity
                })
            }
        }
        
    }

    @IBAction func tapPic(_ sender: AnyObject) {
        performSegue(withIdentifier: "photoSegue", sender: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let profileView = segue.destination as! ProfileViewController
        profileView.receivedImage = self.imageCell.image
    }
    

}
