

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var wordLabelResult: UILabel!
    @IBOutlet weak var enterWordTextField: UITextField!
    
    let reverseManager = ReverseManager()
    var isClear = false

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hideTheKeyBoard()
    }

    func clear() {
        enterWordTextField.text = ""
        wordLabelResult.text = ""
        hideTheKeyBoard()
    }
    
    func printOutTheReversedWord(show: String) {
        let textToShow = reverseManager.reverseTheWord(reverse: show)
        wordLabelResult.text = textToShow
        hideTheKeyBoard()
    }
    
    func hideTheKeyBoard() {
        enterWordTextField.resignFirstResponder()
    }
    
    @IBAction func reverseAction(_ sender: UIButton) {
        if !isClear {
//      reverseTheWord(reverse: enterWordTextField.text ?? "")
            printOutTheReversedWord(show: enterWordTextField.text ?? "")
            
            sender.setTitle("Clear", for: .normal)
            isClear = true
        } else {
            clear()
            sender.setTitle("Reverse", for: .normal)
            isClear = false
        }
    }
}


