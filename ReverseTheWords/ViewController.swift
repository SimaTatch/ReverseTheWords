

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var wordLabelResult: UILabel!
    @IBOutlet weak var enterWordTextField: UITextField!
    @IBOutlet weak var segmentControlOutlet: UISegmentedControl!
    @IBOutlet weak var exceptionNoticeLabel: UILabel!
    @IBOutlet weak var textToIgnoreField: UITextField!
    
    let reverseManager = ReverseManager()
    let exclusionReverseManager = ExclusionRulesReverseManager()
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

    func compareTwoTextFields (textFieldToReverse: UITextField, textFieldNoReverse: UITextField) -> String {
        let reversedText = textFieldToReverse.text ?? ""
        let staticText = textFieldNoReverse.text ?? ""
        
        let wordsReversedText = reversedText.components(separatedBy: .whitespaces)
        let wordsStaticText = staticText.components(separatedBy: .whitespaces)
        var result = ""
        for word in wordsStaticText {
            if !wordsReversedText.contains(word) { continue }
            result.append(word)
        }
        return result
    }
    
    
    func putOutTheReversedWord(show: String) {
        if textToIgnoreField.isHidden {
            let textToShow = exclusionReverseManager.reverseTheWords(toReverse: show)
            wordLabelResult.text = textToShow
            hideTheKeyBoard()
        } else {
            let commonWord = compareTwoTextFields(textFieldToReverse: enterWordTextField, textFieldNoReverse: textToIgnoreField)
            let textWithExclusion = ignoreCommonWord.reverseWords(toReverse: show, toIgnore: commonWord)
            wordLabelResult.text = textWithExclusion
            hideTheKeyBoard()
        }
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
        case 1:
            exceptionNoticeLabel.isHidden.toggle()
            textToIgnoreField.isHidden.toggle()
            wordLabelResult.text = ""
        default:
            break
        }
  
  }
}

