import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelCount.text = "0"
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
    
    @IBOutlet private weak var labelCount: UILabel!
    
    @IBOutlet private weak var historyTextView:  UITextView!
    
    @IBAction private func incrementCounter(_ sender: Any) {
        counter += 1
        updateLabel()
        addToHistory("значение изменено на +1")
    }
    
    @IBAction private func decrementCounter(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            updateLabel()
            addToHistory("значение изменено на -1")
        } else {
            addToHistory("попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction private func resetCounter(_ sender: Any) {
        counter = 0
        updateLabel()
        addToHistory("значение сброшено")
    }
}

