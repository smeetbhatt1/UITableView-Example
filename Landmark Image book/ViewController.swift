//
//  ViewController.swift
//  Landmark Image book
//
//  Created by Smeet Bhatt on 23/10/17.
//  Copyright © 2017 Smeet Bhatt. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var nameArr = [String]()
    var imageArr = [UIImage]()
    var choosenName = ""
    var choosenImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //table view setup
        tableView.dataSource = self
        tableView.delegate = self
        
        //example array creation
        nameArr.append("Colosseum")
        nameArr.append("Great Wall of China")
        nameArr.append("Kremlin")
        nameArr.append("Stonehenge")
        nameArr.append("Taj Mahal")
        
        imageArr.append(#imageLiteral(resourceName: "colosseum"))
        imageArr.append(#imageLiteral(resourceName: "greatwallofchina"))
        imageArr.append(#imageLiteral(resourceName: "kremlin"))
        imageArr.append(#imageLiteral(resourceName: "stonehenge"))
        imageArr.append(#imageLiteral(resourceName: "tajmahal"))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArr.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            nameArr.remove(at: indexPath.row)
            imageArr.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.choosenName = nameArr[indexPath.row]
        self.choosenImage = imageArr[indexPath.row]
        
        performSegue(withIdentifier: "selectedItem", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectedItem" {
            let destVC = segue.destination as! SecondViewController
            destVC.selectedName = choosenName
            destVC.selectedImage = choosenImage
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.imageView?.image = imageArr[indexPath.row]
        cell.textLabel?.text = nameArr[indexPath.row]
        
        
        return cell
    }

}

