//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Bconsatnt on 4/6/17.
//  Copyright © 2017 Bconsatnt. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var imageCell: UIImageView!
    var receivedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageCell.image = receivedImage
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapNav(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
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
