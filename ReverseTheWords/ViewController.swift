

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var wordLabelResult: UILabel!
    @IBOutlet weak var enterWordTextField: UITextField!
    @IBOutlet weak var segmentControlOutlet: UISegmentedControl!
    @IBOutlet weak var exceptionNoticeLabel: UILabel!
    @IBOutlet weak var textToIgnoreField: UITextField!
    
    let reverseManager = ReverseManager()
    let ignoreCommonWord = IgnoreCommonWord()
    var isClear = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        textToIgnoreField.isHidden = true
        exceptionNoticeLabel.isHidden = false
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

    func putOutTheReversedWord(show: String) {
            let textWithExclusion = ignoreCommonWord.reverseWords(toReverse: show, toIgnore: textToIgnoreField.text ?? "")
            wordLabelResult.text = textWithExclusion
            hideTheKeyBoard()
    }
    
    
    func hideTheKeyBoard() {
        enterWordTextField.resignFirstResponder()
    }
    
    @IBAction func resultAction(_ sender: UIButton) {
            putOutTheReversedWord(show: enterWordTextField.text ?? "")
    }
    
    @IBAction func segmentControllAction(_ sender: UISegmentedControl) {
        switch segmentControlOutlet.selectedSegmentIndex
        {
        case 0:
            textToIgnoreField.isHidden.toggle()
            exceptionNoticeLabel.isHidden.toggle()
            wordLabelResult.text = ""
        case 1:
            exceptionNoticeLabel.isHidden.toggle()
            textToIgnoreField.isHidden.toggle()
            wordLabelResult.text = ""
        default:
            break
        }
  
  }
}

