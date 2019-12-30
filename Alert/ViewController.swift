//
//  ViewController.swift
//  Alert
//
//  Created by Dennis Nesanoff on 30.12.2019.
//  Copyright © 2019 Dennis Nesanoff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let switchHide = UISwitch()
    
    @IBOutlet var label: UILabel!
    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.isHidden = true
        
        switchHide.frame = CGRect(x: 50, y: 50, width: 0, height: 0)
        view.addSubview(switchHide)
        
        switchHide.setOn(false, animated: true)
        switchHide.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
    }

    @IBAction func showButton(_ sender: UIButton) {
        label.isHidden = false
        label.text = "Hi"
        showAlert(title: "Error", message: "Send message!", style: .alert)
    }
    
    @objc func switchChanged() {
        if switchHide.isOn {
            label.isHidden = true
            button.isUserInteractionEnabled = false
        } else {
            label.isHidden = false
            button.isUserInteractionEnabled = true
        }
    }
    
    func  showAlert(title: String, message: String, style: UIAlertController.Style) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "ok", style: .default) { (action) in
            let text = alert.textFields?.first?.text
            self.label.text! += ", \(text!)!"
        }
        
        alert.addTextField { (textField) in
            textField.isSecureTextEntry = true
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

