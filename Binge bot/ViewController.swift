//
//  ViewController.swift
//  Binge bot
//
//  Created by Daniel Colangelo on 6/8/19.
//  Copyright © 2019 Daniel Colangelo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var showsLabel: UILabel!
    @IBOutlet weak var randomShowLabel: UILabel!
    @IBOutlet weak var bingebotSpokenLabel: UILabel!
    @IBOutlet weak var addShowTextField: UITextField!
    @IBOutlet weak var addShowButton: UIButton!
    @IBOutlet weak var randomShowStackView: UIStackView!
    @IBOutlet weak var addShowsStackView: UIStackView!
    @IBOutlet weak var showsStackView: UIStackView!
    
    var shows: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showsStackView.isHidden = true
        randomShowStackView.isHidden = true
    }
    
    func updateShowsLabel() {
        showsLabel.text = shows.joined(separator: ", ")
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Please add a show name!", message: "Example: MTV Cribs", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func randomBingeShowButtonWasPressed(_ sender: Any) {
        randomShowLabel.text = shows.randomElement()
        randomShowLabel.isHidden = false
        bingebotSpokenLabel.isHidden = false
    }

    @IBAction func addShowButtonWasPressed(_ sender: Any) {
        if addShowTextField.text == "" {
            showAlert()
        } else {
            guard let showName = addShowTextField.text else { return }
            shows.append(showName)
            updateShowsLabel()
            addShowTextField.text = ""
            showsStackView.isHidden = false
            
            if shows.count > 1 {
                randomShowStackView.isHidden = false
                bingebotSpokenLabel.isHidden = true
                randomShowLabel.isHidden = true
            }
            
        }
        
    }
    
}

