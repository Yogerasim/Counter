//
//  ViewController.swift
//  Counter
//
//  Created by Филипп Герасимов on 25/03/25.
//

import UIKit

class ViewController: UIViewController {
    private var counter = 0
    private func updateLabel() {
            labelCount.text = "\(counter)"
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        labelCount.text = "0"
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonDidTab(_ sender: Any) {
        counter += 1
        labelCount.text = "\(counter)"
    }
    @IBOutlet weak var labelCount: UILabel!
    
    @IBAction func buttonPlusTab(_ sender: Any) {
        counter += 1
                updateLabel()
    }
    @IBAction func buttonMinusTab(_ sender: Any) {
        if counter > 0 {
                    counter -= 1
                    updateLabel()
                }
    }
    @IBAction func buttonZero(_ sender: Any) {
        counter = 0
        updateLabel()
    }
}

