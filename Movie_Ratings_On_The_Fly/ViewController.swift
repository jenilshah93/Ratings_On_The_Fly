//
//  ViewController.swift
//  Movie_Ratings_On_The_Fly
//
//  Created by Jenil Shah on 4/26/17.
//  Copyright © 2017 NerdAttack. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var TitleTextField: UITextField!
    override func viewDidLoad() {
    
        super.viewDidLoad()
      //nib.
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        TitleTextField.text = ""
    }
    override var prefersStatusBarHidden: Bool{
        
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        TitleTextField.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        TitleTextField.resignFirstResponder()
        return true
    }
    
    @IBAction func SearchButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "segue12", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue12" {
            if let destination = segue.destination as? SecondViewController {
                if let title = TitleTextField.text{
                    destination.titleString = title
                }
            }
        }
    }
}

