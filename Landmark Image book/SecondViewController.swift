//
//  SecondViewController.swift
//  Landmark Image book
//
//  Created by Smeet Bhatt on 23/10/17.
//  Copyright © 2017 Smeet Bhatt. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var selectedName = ""
    var selectedImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = selectedImage
        nameLabel.text = selectedName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
