//
//  ViewController.swift
//  Counter
//
//  Created by Филипп Герасимов on 25/03/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var labelCount: UILabel!
    @IBOutlet weak var historyTextView:  UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelCount.text = "0"
        // Do any additional setup after loading the view.
    }
    
    private var counter = 0
    
    private func updateLabel() {
            labelCount.text = "\(counter)"
            historyTextView.text = "История изменений:\n"
                historyTextView.isEditable = false
                historyTextView.isScrollEnabled = true
        
        }
    
    
    private func addToHistory(_ message: String) {
            let timestamp = getCurrentTime()
            let newEntry = "[\(timestamp)]: \(message)\n"
            historyTextView.text += newEntry
            
            let range = NSMakeRange(historyTextView.text.count - 1, 1)
            historyTextView.scrollRangeToVisible(range)
        }
    private func getCurrentTime() -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm:ss"
            return formatter.string(from: Date())
        }
        

    @IBAction func buttonDidTab(_ sender: Any) {
        counter += 1
        labelCount.text = "\(counter)"
    }
    
    
    @IBAction func buttonPlusTab(_ sender: Any) {
        counter += 1
        updateLabel()
        addToHistory("значение изменено на +1")
    }
    @IBAction func buttonMinusTab(_ sender: Any) {
        if counter > 0 {
                    counter -= 1
                    updateLabel()
                    addToHistory("значение изменено на -1")
                } else {
                    addToHistory("попытка уменьшить значение счётчика ниже 0")
                }
    }
    @IBAction func buttonZero(_ sender: Any) {
        counter = 0
        updateLabel()
        addToHistory("значение сброшено")
    }
}

