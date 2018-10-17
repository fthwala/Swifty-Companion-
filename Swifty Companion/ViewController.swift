//
//  ViewController.swift
//  Swifty Companion
//
//  Created by Felix Ntokozo THWALA on 2018/10/16.
//  Copyright © 2018 Felix Ntokozo THWALA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var userNameTextFied: UITextField!
    
    
    @IBAction func sendUserNameButton(_ sender: UIButton) {
        //self.performSegue(withIdentifier: "mySegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegue" {
            let destination = segue.destination as? MainViewController
                destination?.user = userNameTextFied.text!
        }
    }


}

